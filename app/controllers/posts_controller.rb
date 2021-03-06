# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def search
    # 検索フォーム
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    render('posts/index')
  end

  def show; end

  def new
    @post = Post.new
    @post.taggings.build
  end

  def create
    @post = Post.new(title: params[:title],
                     url: params[:url],
                     reference: params[:reference])
    tag_input
    if @post.save
      redirect_to('/')
      flash[:notice] = '投稿が作成されました。'
    else
      render('posts/new')

    end
  end

  def edit; end

  def update
    @post.title = params[:title]
    @post.url = params[:url]
    @post.reference = params[:reference]
    tag_input
    if @post.save
      redirect_to root_path
      flash[:notice] = '投稿が編集されました。'
    else
      render('posts/edit')
    end
  end

  def destroy
    @post.destroy
    redirect_to('/')
    flash[:notice] = '投稿が削除されました。'
  end

  def post_params
    params.require(:post).permit(:title, :reference, :url, :tag, :tag_id, :post_id)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  private

  def tag_input
    tgs = params[:tag].split(',')
    tgs. each do |t|
      @post.tags.build(name: t)
    end
  end
end
