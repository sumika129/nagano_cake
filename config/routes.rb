Rails.application.routes.draw do


  root to: "public/homes#top"

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit]
  end

  namespace :public do
    get 'home/about'=>'homes#about',as:'about'
    resources :customers, only: [:show, :edit, :update]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :items, only: [:show, :index]
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
    resources :cart_items, only: [:index, :create, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    post 'orders/complete'
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
