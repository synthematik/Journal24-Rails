class ArticlesController < ApplicationController
  include Pagy::Backend

  before_action :require_user, except: [:index, :show]
  before_action :require_owner, only: [:edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @articles = pagy(Article.includes(:user).order(created_at: :desc))
    @popular_articles = Article.includes(:user).order(updated_at: :desc).limit(5)
  end

  def search
    query = params[:query]
    @pagy, @articles = pagy(Article.where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%").includes(:user).order(created_at: :desc))
    @popular_articles = Article.includes(:user).order(updated_at: :desc).limit(5)
    render :index
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private
  def set_article
    @article = Article.find(params[:id])
  end

  def require_owner
    @article = Article.find(params[:id])
    unless @article.user_id == current_user.id
      redirect_to root_path, alert: "You are not authorized to modify this article"
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end