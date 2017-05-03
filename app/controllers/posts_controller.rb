class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :search_index]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user

    @post=@user.posts.all.order("created_at desc")

  end

  def show
    @post = Post.find(params[:id])
  end

  def views
        @post=Post.find(params[:post_id])
  end
  def new
    @post=Post.new
  end


  def update
   if @post.update post_params
     redirect_to @post, notice: "yay"
   else
     render 'edit'
   end
 end
   def create

@user = current_user
     @post = @user.posts.new post_params

     if @post.save
       redirect_to @post, notice: "Post created!"
     else
       render 'new', notice: "There was a problem"
   end
  end
  def destroy
    @post.destroy
    redirect_to posts_path
 end

 def search_index
  @post = Post.all
  if params[:search]
    @post = Post.search(params[:search]).order("created_at DESC")
  else
    @post = Post.all.order("created_at DESC")
  end
end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
  @post= Post.find(params[:id])
end


end
