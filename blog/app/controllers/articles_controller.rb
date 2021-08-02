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
    @article = Article.new
  end

  # RENDER TO EDIT AN ARTICLE
  def edit
    @article = Article.find(params[:id])
  end

  # CREATE ACTION
  def create
    @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

# UPDATE ACTION
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # VALIDATE FIELDS TO PASS
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end