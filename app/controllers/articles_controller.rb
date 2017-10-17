class ArticlesController < ApplicationController

  def article_params

    params.require(:article).permit(:title, :description, :username)
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.find_by(id: session[:user_id])
    if @article.save
      flash[:success] = "Artikel wurde erfolgreich angelegt!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    set_article
  end

  def edit
    set_article
  end

  def update
    set_article
    if @article.update(article_params)
      flash[:success] = "Artikel wurde erfolgreich bearbeitet!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    set_article
    @article.destroy
    flash[:danger] = "Artikel wurde erfolgreich gelöscht!"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
  
end