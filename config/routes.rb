Rails.application.routes.draw do

  namespace :api, format: 'json' do
    resources :contents,  only:[:index]
    #meansコントローラー↓
    get 'display/:id', to: 'means#display'
    post 'means_post', to: 'means#post'
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations'  ,
    sessions: 'users/sessions'            ,
    passwords: 'users/passwords'
  }
  
  devise_scope :user do
    get 'sign_in', to: 'users/registrations#index'
    get 'sign_out', to: 'users/sessions#destroy'

    #登録フォームでエラーが起きた後でロードした時のたいしょ
    get '/users', to: redirect('/users/sign_up', status: 301)
  end

  
  root 'homes#home'

 #------------------------------------------------------------------------------------------------------ 
 # namespace :api  do
  #  get '/new', to: 'registers#new'
   # resources :registers,format:'json', except:[:new]
  #end#
  #api以外のリクエストは、全部homeコントローラーのhomeアクション
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #------------------------------------------------------------------------------------------------------
end
