class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # get all cities
  get "/cities" do
    City.all.to_json(include: :posts)
  end

  # post new city
  post "/cities" do
    City.create(
      name: params[:name],
      population: params[:population],
      image: params[:image],
      country: params[:country]
    ).to_json(include: :posts)
  end

  # delete city
  delete "/cities/:city_id" do
    city = City.find(params[:city_id])
    city.destroy
    city.to_json
  end

  # get post
  get "/posts/:post_id" do
    Post.find(params[:post_id]).to_json(include: :city)
  end

  # post new post for a city
  post "/cities/:city_id/posts" do
    post = Post.create(
      city_id: params[:city_id],
      category: params[:category],
      title: params[:title],
      body: params[:body]
    )
    post.to_json
  end

  # patch post
  patch "/posts/:post_id" do
    post = Post.find(params[:post_id])
    post.update(
      category: params[:category],
      title: params[:title],
      body: params[:body]
    )
    post.to_json
  end

  # delete post
  delete "/posts/:post_id" do
    post = Post.find(params[:post_id])
    post.destroy
    post.to_json
  end

end

