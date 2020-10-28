class PostsController < ApplicationController
  before_action :find_post, only: [:show,:edit, :update, :destroy]  
  def index
    @post = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "新增完成"
    else
      render :new
    end
  end

  def show
    @post = Post.all
  end

  def edit
  end

  def update
    @post = Post.edit(post_params)
    if @post.save
      redirect_to posts_path, notice: "更新完成"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path, notice: "刪除成功"
  end

end

private

def post_params
  params.require(:book).permit(:title,:description)
end

def find_post
  @post = Post.find(params [:id])
end 
  