class CategoriasController < ApplicationController
    def index
        @categorias = Categoria.all
    end
    
    def show
        @categoria = Categoria.find(params[:id])
    end
    
    def new
        @categoria = Categoria.new
    end

    def create
        @categoria = Categoria.new(categoria_params)
       
        if @categoria.save
          redirect_to @categoria
        else
          render 'new'
        end
    end
       
    private
    def categoria_params
        params.require(:categoria).permit(:nome, :descricao)
    end
end
