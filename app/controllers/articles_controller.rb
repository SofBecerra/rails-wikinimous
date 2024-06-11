class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.details = params[:article][:details]
    @article.save
    redirect_to tasks_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to tasks_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :details, :completed)
  end
end
