class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_resource, except: %i[index]

  def index
    @blogs = current_user.blogs.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @blog.body = @blog.rich_body.to_plain_text
    if @blog.save
      redirect_to blogs_path, notice: 'Blog was successfully created.'
    else
      render :new, notice: 'Blog error'
    end
  end

  def update
    if @blog.update(blog_params)
      @blog.body = @blog.rich_body.to_plain_text
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'Blog was successfully destroyed.'
  end

  private

  def load_resource
    return @blog = Blog.find(params[:id]) if params[:id].present?
    return @blog = current_user.blogs.new(blog_params) if params[:blog].present?

    @blog = current_user.blogs.new
  end

  def blog_params
    params.require(:blog).permit(:title, :description, :rich_body, :tags, :reference, :published, :user_id, :poster )
  end
end
