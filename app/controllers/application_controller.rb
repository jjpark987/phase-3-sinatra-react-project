class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # get all cities
  get "/cities" do
    City.all.to_json
  end

  # get all posts for a city
  get "/cities/:city_id/posts" do
    Post.where(city_id: params[:city_id]).to_json
  end
  
  # post new post to a city
  post "/cities/:city_id/posts" do
    post = Post.create(
      city_id: params[:city_id],
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

end
