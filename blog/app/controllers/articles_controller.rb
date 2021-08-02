class ArticlesController < ApplicationController
  
  # RENDER AND LIST ALL
  def index
    @articles = Article.all
  end

  # RENDER THE CREATED ARTICLE
  def show
    
    #  note the use of an instance variable 
    #  (prefixed with @) to hold a reference to the article object. 
    #  We do this because Rails will pass all instance variables to the view.
    @article = Article.find(params[:id])
  end
  
  # RENDER THE NEW FORM
  def new
  end

  # CREATE ACTION
  def create
    @article = Article.new(article_params)
 
    @article.save
    redirect_to @article  
  end

  # VALIDATE FIELDS TO PASS
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end