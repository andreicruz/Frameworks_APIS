class CategoriasController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @categorias = Categoria.all.order("created_at ASC")
        # API REST
        # render json: {status: 'SUCCESS', message:'Categorias carregadas', data:@categorias},status: :ok
        render json: @categorias
    end
    
    def show
        @categoria = Categoria.find(params[:id])
        # render json: {status: 'SUCCESS', message:'Categoria', data:@categoria},status: :ok
        render json: @categoria
    end
    
    def new
        @categoria = Categoria.new
        render json: @categoria
    end

    def edit
        @categoria = Categoria.find(params[:id])
        render json: @categoria
    end

    def create
        @categoria = Categoria.new(categoria_params)
       
        if @categoria.save
          #redirect_to @categoria
          render json: @categoria
        else
          #render 'new'
        end
    end
       
    def update
        @categoria = Categoria.find(params[:id])
       
        if @categoria.update(categoria_params)
         # redirect_to @categoria
          render json: @categoria
        else
          #render 'edit'
          #render json: @categoria
        end
    end

    def destroy
        @categoria = Categoria.find(params[:id])
        if @categoria.destroy
           # flash[:success] = 'Categoria deletada'
            render json: @categoria
            #render json: {status: 'SUCCESS', message:'Categoria Deletada', data:@categoria},status: :ok
        else
            #flash[:danger] = 'Categoria vinculada a um produto, impossível deletar'
            #render json: {status: 'ERROR', message:'Erro ao Deletar', data:@categoria.erros},status: :unprocessable_entity
        end
     
        #redirect_to categorias_path
    end

    private
    def categoria_params
        params.require(:categoria).permit(:nome, :descricao)
    end
end
