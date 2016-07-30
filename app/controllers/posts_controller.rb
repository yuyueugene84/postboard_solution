class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def vote
    @post = Post.find(params[:id])
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:success] = 'Your vote was counted!'
    else
      flash[:error] = "You can only vote for <strong>#{@post.title}</strong> once!".html_safe
    end

    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end
end