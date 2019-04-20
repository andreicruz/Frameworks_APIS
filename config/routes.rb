Rails.application.routes.draw do
  get 'index/index'
  
  scope path_names: { new: "novo", edit: "editar" } do
    resources :produtos
  end

  root 'index#index'
end
