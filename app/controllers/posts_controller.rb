class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post_form = CreatePostForm.new
  end

  def create
    @post_form = CreatePostForm.new(create_post_params)
    if @post_form.valid?
      author = User.find_by(username: @post_form.author_name)
      author ||= User.create(username: @post_form.author_name)
      @post = Post.create(title: @post_form.title, body: @post_form.body, user_id: author.id, published: true)
      redirect_to post_path(@post.id)
    else
      render :new  
    end
  end

  def create_post_params
    params.require(:create_post_form).permit(:title, :body, :author_name)
  end

  def show
    @post = Post.find(params[:id])
  end
end
