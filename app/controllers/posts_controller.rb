  class PostsController < ApplicationController
    before_action :signed_in_user, only:[:new,:create,:edit]
    before_action :set_post, only:[:update,:edit]
    def index
      if(params[:category_id].nil?)
        @posts = Post.order(created_at: :desc)
      else
        @posts = Post.where(category_id: params[:category_id]).order(created_at: :desc)
      end
      @categories = Category.all
      @posts_decorator = PostDecorator.build_collection(@posts)
    end
    def new
      @post = Post.new
      @categories = Category.all
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
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:category_id)
    end
    def set_post
      @post = Post.find(params[:id])
    end
  end
