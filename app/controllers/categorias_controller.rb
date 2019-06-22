class CategoriasController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @categorias = Categoria.all.order("created_at ASC")
        # API REST
        render json: {status: 'SUCCESS', message:'Categorias carregadas', data:@categorias},status: :ok
    end
    
    def show
        @categoria = Categoria.find(params[:id])
        render json: {status: 'SUCCESS', message:'Categoria', data:@categoria},status: :ok
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
          render json: {status: 'SUCCESS', message:'Categoria Salva', data:@categoria},status: :ok
        else
          render 'new'
          render json: {status: 'ERROR', message:'Erro ao Criar', data:@categoria.erros},status: :unprocessable_entity
        end
    end
       
    def update
        @categoria = Categoria.find(params[:id])
       
        if @categoria.update(categoria_params)
          redirect_to @categoria
          render json: {status: 'SUCCESS', message:'Categoria editada', data:@categoria},status: :ok          
        else
          render 'edit'
          render json: {status: 'ERROR', message:'Erro ao editar', data:@categoria.erros},status: :unprocessable_entity
        end
    end

    def destroy
        @categoria = Categoria.find(params[:id])
        if @categoria.destroy
            flash[:success] = 'Categoria deletada'
            render json: {status: 'SUCCESS', message:'Categoria Deletada', data:@categoria},status: :ok
        else
            flash[:danger] = 'Categoria vinculada a um produto, impossível deletar'
            render json: {status: 'ERROR', message:'Erro ao Deletar', data:@categoria.erros},status: :unprocessable_entity
        end
     
        redirect_to categorias_path
    end

    private
    def categoria_params
        params.require(:categoria).permit(:nome, :descricao)
    end
end
