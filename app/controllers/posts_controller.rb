  class PostsController < ApplicationController
    before_action :signed_in_user, only:[:new,:create,:edit]
    before_action :set_post, only:[:update,:edit]
    def index
      @posts = Post.all
    end
    def new
      @post = Post.new
    end
    def edit
    end
    def create
      @post = current_user.posts.build(post_params) 
      if @post.save
        redirect_to posts_url
      else
        render "new"
      end
    end
    def update
      if @post.update(post_params)
        redirect_to posts_url  
      else
        render :edit
      end
    end
    def show
      render text: "Hello"
    end
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
    private
    def post_params
      params.require(:post).permit(:title,:content)
    end
    def set_post
      @post = Post.find(params[:id])
    end
  end
