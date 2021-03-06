# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  title              :string           not null
#  body               :text             not null
#  img_url            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Post < ApplicationRecord
  validates :title, :body, :category, presence: true
  validates :category, inclusion: {
    in: [
    "Cosmetology", "Culinary", "Art/Design", "Automotive", "Massage Therapy", "Animal Care",
    "Fitness/Nutrition", "Travel/Tourism", "Film/Photography"
  ]}

  belongs_to :user
  has_many :bookmarks
  has_many :bookmarked_users, through: :bookmarks, source: :user

  has_attached_file :image, default_url: "https://res.cloudinary.com/jun/image/upload/v1506659435/Doge_sggjpf.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
