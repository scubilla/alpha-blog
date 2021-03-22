class ArticlesController < ApplicationController
    def show
       #byebug 
        # variable de instacia con arroba
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end

    def new
    end

    def create
        #@article =Article.new(params[:article])(
        @article =Article.new(params.require(:article).permit(:title, :description))
        @article.save
        redirect_to @article  # de aqui toma el id y lo muestra
    end

end

