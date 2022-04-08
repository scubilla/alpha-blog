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

    def edit
        @article = Article.find(params[:id])  # traido de show
    end

    def create
        #@article =Article.new(params[:article])(
        @article =Article.new(params.require(:article).permit(:title, :description))
        #validar si graba y poner mensajes
        if @article.save
           flash[:notice] = "Articulo creado satisfactoriamente."
           redirect_to @article  # de aqui toma el id y lo muestra
        else 
            render 'new'   # si no graba reenvia al new
        end    
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Articulo actualizado con exito."
            redirect_to @article
        else
            render 'edit'
        end         
    end

    def destroy
        @article = Article.find(params[:id]) 
        @article.destroy
        redirect_to articles_path
    end


end

