class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # start of search lists all countries for all users
  get "/countries" do
    Country.all.to_json
  end

  # after clicking a country, render a list of cities
  get "/countries/:country_id/cities" do
    country = Country.find(params[:country_id])
    cities = City.where(country_id: params[:country_id])
    { country: country, cities: cities }.to_json
  end

  # after clicking a city, render a list of posts
  get "/countries/:country_id/cities/:city_id/posts" do
    country = Country.find(params[:country_id])
    city = City.find_by(id: params[:city_id], country_id: params[:country_id])
    posts = Post.where(city_id: params[:city_id])
    { country: country, city: city, posts: posts }.to_json
  end

  # from the list of posts, user can click on one to see details
  get "/countries/:country_id/cities/:city_id/posts/:post_id" do
    country = Country.find(params[:country_id])
    city = City.find_by(id: params[:city_id], country_id: params[:country_id])
    post = Post.find_by(id: params[:post_id], city_id: params[:city_id])
    { country: country, city: city, post: post }.to_json
  end

  # from the list of posts, user can post a new post
  post "/users/:user_id/countries/:country_id/cities/:city_id/posts" do
    city = City.find_by(id: params[:city_id], country_id: params[:country_id])
    post = Post.create(
      user_id: params[:user_id],
      city_id: params[:city_id],
      category: params[:category],
      title: params[:title],
      description: params[:description]
    )
    post.to_json
  end

  # renders a list of user-specific posts
  get "/users/:user_id/my-posts" do
    posts = Post.where(user_id: params[:user_id])
    posts.to_json(include: { city: { include: :country } })
  end

  # from the list of user-specific posts, click on one to see details
  get "/users/:user_id/my-posts/:post_id" do
    post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
    post.to_json(include: { city: { include: :country } })
  end

  # from the post details, user can patch that post
  patch "/users/:user_id/my-posts/:post_id" do
    post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
    post.update(
      category: params[:category],
      title: params[:title],
      description: params[:description]
    )
    post.to_json(include: { city: { include: :country } })
  end

  # from the post details, user can delete that post
  delete "/users/:user_id/my-posts/:post_id" do
    post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
    post.destroy
    post.to_json(include: { city: { include: :country } })
  end

end
