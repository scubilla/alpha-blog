class ArticlesController < ApplicationController
    def show
       #byebug 
        # variable de instacia con arroba
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end

    # crear variable de instancia para manejador de error,viene de render new
    def new
        @article  = Article.new 
    end

    def create
        #@article =Article.new(params[:article])(
        @article =Article.new(params.require(:article).permit(:title, :description))
        #validar si graba y poner mensajes
        if @article.save
           flash[:notice] = "Articulo creado satisfactoriamente."
           redirect_to @article  # de aqui toma el id y lo muestra
        else 
            render 'new'   
        end    
    end

end

