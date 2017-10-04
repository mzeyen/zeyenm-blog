class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Artikel wurde erfolgreich angelegt"
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
      flash[:notice] = "Artikel wurde erfolgreich bearbeitet"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    set_article
    @article.destroy
    flash[:notice] = "Artikel wurde erfolgreich gelöscht"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
  def article_params

    params.require(:article).permit(:title, :description)
  end

end