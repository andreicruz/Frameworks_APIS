class CategoriasController < ApplicationController
    def index
        @categorias = Categoria.all
    end
    
    def show
        @categoria = Categoria.find(params[:id])
    end
    
    def new
    end

    def create
        @categoria = Categoria.new(categoria_params)
       
        @categoria.save
        redirect_to @categoria
      end
       
    private
    def categoria_params
        params.require(:categoria).permit(:nome, :descricao)
    end
end
