class BlogsController < ApplicationController
  
  def index
    @bloogs = Bloog.all.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
  Bloog.create(text: blog_params[:text], user_id:current_user.id)
  end
  
  def destroy
  blog = Bloog.find(params[:id])
  blog.destroy if blog.user_id == current_user.id
  end
  
  def edit
  @blog = Bloog.find(params[:id])
  end
  
  def update
  blog = Bloog.find(params[:id])
  blog.update(text: blog_params[:text]) if blog.user_id == current_user.id
  redirect_to "/" 
  end
  
  def show
  @blog = Bloog.find(params[:id])
  end
  
  private
  def blog_params
  params.permit(:text)
  end
  
end
