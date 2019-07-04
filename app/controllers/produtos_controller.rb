class ProdutosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @produtos = Produto.all.order("created_at ASC")
        render json: @produtos
    end
    
    def show
        @produto = Produto.find(params[:id])
        render json: @produto
    end
    
    def new
        @produto = Produto.new
        @categoria_options = Categoria.all.map{ |cat| [ cat.nome, cat.id ] }
        render json: @produto
    end

    def edit
        @produto = Produto.find(params[:id])
        @categoria_options = Categoria.all.map{ |cat| [ cat.nome, cat.id ] }
        render json: @produto
    end

    def create
        @produto = Produto.new(produto_params)
        @categoria_options = Categoria.all.map{ |cat| [ cat.nome, cat.id ] }
       
        if @produto.save
         # redirect_to @produto
          render json: @produto
        else
          #render 'new'
          render json: @produto
        end
    end
       
    def update
        @produto = Produto.find(params[:id])
       
        if @produto.update(produto_params)
          #redirect_to @produto
          render json: @produto
        else
          #render 'edit'
          render json: @produto
        end
    end

    def destroy
        @produto = Produto.find(params[:id])
        if @produto.destroy
       #     flash[:success] = 'Produto deletado'
            render json: @produto
        else
        #    flash[:danger] = 'Não foi possível deletar o produto'
            render json: @produto
        end
     
      #  redirect_to produtos_path
    end

    private
    def produto_params
        params.require(:produto).permit(:nome, :descricao, :preco, :categoria_id)
    end
end
