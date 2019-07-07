class UsuariosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @usuarios = Usuario.all.order("created_at ASC")
        # API REST
        # render json: {status: 'SUCCESS', message:'Categorias carregadas', data:@categorias},status: :ok
        render json: @usuarios
    end

    def show
        @usuario = Usuario.find(params[:id])
        # render json: {status: 'SUCCESS', message:'Categoria', data:@categoria},status: :ok
        render json: @usuario
    end
        
    def new
        @usuario = usuario.new
        render json: @usuario
    end

    def edit
        @usuario = Usuario.find(params[:id])
        render json: @categoria
    end
    
    def create
        @usuario = Usuario.new(usuario_params)
       
        if @usuario.save
          render json: @usuario
        else
          #render 'new'
        end
    end
           
    def update
        @usuario = Usuario.find(params[:id])
       
        if @usuario.update(usuario_params)
          render json: @usuario
        else
          #render 'edit'
          #render json: @categoria
        end
    end

    def destroy
        @usuario = Usuario.find(params[:id])
        if @usuario.destroy
           # flash[:success] = 'Categoria deletada'
            render json: @usuario
            #render json: {status: 'SUCCESS', message:'Categoria Deletada', data:@categoria},status: :ok
        else
            #flash[:danger] = 'Categoria vinculada a um produto, impossível deletar'
            #render json: {status: 'ERROR', message:'Erro ao Deletar', data:@categoria.erros},status: :unprocessable_entity
        end
     
        #redirect_to categorias_path
    end

    private
    def usuario_params
        params.require(:usuario).permit(:nome, :sobrenome, :email, :senha, :cep, :logradouro, :bairro, :localidade, :uf)
    end
end
