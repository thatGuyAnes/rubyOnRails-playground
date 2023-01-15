class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # puts params["controller"]
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # render plain: @article
  end

  def create
    # render plain: params[:article] # --> Renders the params hash in the browser
    # we need to whitelist the params used to save the new article (title and description) :
    # params.require(:article).permit(:title, :description)
    @article = Article.new(article_params)
    @article.user = User.first

    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  # Finds the article by id
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
