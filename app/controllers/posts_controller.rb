class PostsController < ApplicationController
  def index
    @posts = Post.all
    @search = Post.search do
      fulltext params[:search]
      with(:published_at).less_than(Time.zone.now)
      facet(:publish_month)
      with(:publish_month, params[:month]) if params[:month].present?
    end
    @posts = @search.results
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

 def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
def post_params
  params.require(:post).permit(:name, :content, :published_mob)
end  
    

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end
end
