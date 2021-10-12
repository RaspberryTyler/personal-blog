class PostsController < ApplicationController
  def index
    @posts = Post.order("published desc").where("published is not null").all
  end

  def show
    slug = params[:slug];
    @post = Post.where(slug: slug).where("published is not null").first!
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end
end
