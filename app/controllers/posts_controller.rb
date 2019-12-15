class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destory]
  def index
    #@posts =Post.all.order(created_at: :desc)
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(title: params[:title],url: params[:url],reference: params[:reference],)
    @post.tag_list.add(params[:tag_list])
    if @post.save
      redirect_to("/")
      flash[:notice] = "投稿が作成されました。"
    else
      render("posts/new")
      
    end
  end
  
  def edit
  end
  
  def update
    @post.title = params[:title]
    @post.url = params[:url]
    @post.reference = params[:reference]
    
    if @post.save
      redirect_to("/")
      flash[:notice] = "投稿が編集されました。"
    else
      render("posts/edit")
    end
    
  end
  
  def destroy
    @post.destroy
    redirect_to("/")
    flash[:notice] = "投稿が削除されました。"
  end


  def post_params
    params.require(:post).permit(:title, :reference, :url, :tag_list) 
    #tag_list を追加
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

