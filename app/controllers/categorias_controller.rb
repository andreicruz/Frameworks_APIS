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

    def edit
        @categoria = Categoria.find(params[:id])
    end

    def create
        @categoria = Categoria.new(categoria_params)
       
        if @categoria.save
          redirect_to @categoria
        else
          render 'new'
        end
    end
       
    def update
        @categoria = Categoria.find(params[:id])
       
        if @categoria.update(categoria_params)
          redirect_to @categoria
        else
          render 'edit'
        end
    end

    private
    def categoria_params
        params.require(:categoria).permit(:nome, :descricao)
    end
end
