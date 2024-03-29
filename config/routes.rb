Rails.application.routes.draw do

  namespace :admin do

    patch 'ordered_items/:id' => 'ordered_items#update'
    get 'orders/:id' => 'orders#show', as: 'orders'
    patch 'orders/:id' => 'orders#update'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update, :show]

    resources :items, except: [:destroy]

    get '/' => 'homes#top' , as: "login"

  end

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information' => 'public/customers#update'
  get 'customers/out_check' => 'public/customers#out_check'
  patch 'customers/out' => 'public/customers#out'

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  scope module: :public do

    get "search" => "searchs#search"

    resources :shipping_addresses, except: [:show, :new]

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post '/confirm' => 'orders#confirm'
        get '/complete' => 'orders#complete'
      end
    end

    resources :cart_items, only: [:index, :destroy, :update, :create] do
      collection do
        delete '/destroy_all' => 'cart_items#destroy_all'
      end
    end

    resources :items, only: [:index, :show]

    get 'item/search' => 'items#search'
  end

  get 'customers' =>  redirect("/customers/sign_up")

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
