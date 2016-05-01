class BlogPostsController < ApplicationController
  before_action :get_blog_post, only: :show
  before_action :get_author, only: :show

  def index
    @blog_posts = BlogPost.all.reverse
  end

  def show
  end

  private
  def get_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def get_author
    @author = @blog_post.author
  end
end
