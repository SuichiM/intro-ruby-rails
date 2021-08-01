class ArticlesController < ApplicationController
  def new
  end

  def show
    
    #  note the use of an instance variable 
    #  (prefixed with @) to hold a reference to the article object. 
    #  We do this because Rails will pass all instance variables to the view.
    @article = Article.find(params[:id])
  end
 
  def new
  end

  def create
    @article = Article.new(article_params)
 
    @article.save
    redirect_to @article  
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end