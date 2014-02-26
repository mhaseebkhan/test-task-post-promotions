class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, except: [:promotion_index, :promotion_show, :increment_promotion]

  layout "promotion", only: [:promotion_index, :promotion_show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  # GET /promotions
  def promotion_index
    @posts = Post.all
  end

  # GET /promotion/:id
  def promotion_show
    @post = Post.find(params[:id])
  end

  # POST /increment_promotion
  def increment_promotion
    ## increment_counter is best way to implement this functionality
    ## but increment_counter skips activerecord validation so we implemented into manual way.

    # Post.increment_counter :current_clicks, params[:id]
    post = Post.where(id: params[:id]).first
    post.update_attributes(:current_clicks => post.current_clicks + 1) if post.present?

    render nothing: true
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = current_user.posts.where(id: params[:id]).first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :url, :current_clicks, :allowed_clicks, :user_id)
  end

end
