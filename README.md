# Artis
[Link to Demo](https://nyxinu.github.io/artis_splash_page/)

Artis is a cross platform mobile application for connecting professionals to customers who want quality at a prices that works for them.

Whether you are an aspiring entrepreneur looking to build your client base, or a recent graduate try to make some money on the side. Artis will help you connect with users seeking your skill set. Likewise users who want professional service without emptying their wallet can find a professional that meets exactly their needs.

## Technologies
This project is built on React Native and Ruby on Rails. Ruby on Rails allows for quick development through many ready-made plugins and modules, which reduces the need for boilerplate code. On the front-end React Native is used because of its strong performance for mobile environments as well as the ability to use the same code for deployment on IOS and Android. This will allow our app to be available for most users in minimal time.

Amazon Web Service provides us with quick and reliable image hosting. Paperclip is also used as it an easy file attachment library for ActiveRecord.

Axios is utilized to make calls to our database.
```
export const postPost = (post) => {
  return axios({
    method: 'POST',
    url: `${url}/api/posts`,
    dataType: "JSON",
    contentType: false,
    processData: false,
    data: post
  });
};

export const filterPosts = (searchTerm) => (
  axios({
    method: 'GET',
    url: `${url}/api/posts?searchTerm=${searchTerm}`,
  })
);
```
Action Cable allows for real-time chat functionality by seamlessly integrating WebSockets with Rails.
```
  def create
    @personal_message = PersonalMessage.new(personal_message_params)
    if @personal_message.save
      #broadcasts to specific messages channel using conversation_id
      ActionCable.server.broadcast( "messages_#{params[:conversation_id]}",
        message: @personal_message.body,
        user: @personal_message.user.username
      )
    end
  end
```

## Design Documents
[View Wireframes](https://github.com/sohbr/artis/blob/master/docs/Artis.png)

## Future Directions
### Location Filter
This will allow certain categories to be automatically filtered by location so users will only see post within their set radius.

### Booking System
Users and service provider can agree on a time and location and add the event to either google calendar. This will also allow users to keep track of previously hired professionals.

### IOS and Google Play App Store
We plan to publish Artis to the App stores. To gain publicity we will advertise the app on trade school social sites, such as reddit sub groups and facebook groups.
