class PostsController < ApplicationController
  include ActionView::Helpers::DateHelper
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  # GET /wall
  # GET /wall.rss
  def index
    @posts = Post.joins(:user).order('created_at DESC')

    @user = current_user.username if current_user.present?

    @post = Post.new

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render json: PostDecorator.decorate_collection(@posts)
      end
      format.rss
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        render json: PostDecorator.decorate(@post)
      end
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.date = DateTime.now
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json do
          render json: PostDecorator.decorate(@post), status: :created, location: @post
        end
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content, :date)
  end
end
