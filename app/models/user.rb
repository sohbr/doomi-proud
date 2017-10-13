# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string           not null
#

class User < ApplicationRecord
  validates :username, :email, :session_token, :password_digest, presence: true
  validates :username, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  has_secure_password

  attr_reader :password

  has_many :posts
  has_many :personal_messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions


  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    user && user.is_password?(pw) ? user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def existing_chat_users
    existing_chat_users = []
    self.chats.each do |chat|
      existing_chat_users.concat(
        chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user}
        )
    end
    existing_chat_users.uniq
  end

  private

  def ensure_session_token
    generate_unique_session_token unless self.session_token
  end

  def generate_unique_session_token
    self.session_token = SecureRandom::urlsafe_base64
    while User.find_by(session_token: session_token)
      self.session_token = SecureRandom::urlsafe_base64
    end
    self.session_token
  end
end
