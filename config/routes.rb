Rails.application.routes.draw do

  root 'homes#home'
  

  resources :registers
  #registersコントローラーをRESTFULL
  #/XXXs::index/:GET一覧画面を
  #生成
  #/XXXs/:id::show:GET 詳細画面を生成
  #/XXXs/new::newGET 登録画面を生成
  #/XXXs::create POST 登録処理
  #/XXXs/:id/edit::edit GET 編集画面を生成
  #/XXXs/:id::update PUT 更新処理
  #/XXXs/:id::destroy DELETE	削除処理
  
  
  #namespace :api do
    #apiの処理はここに記述
  #end#
  #api以外のリクエストは、全部homeコントローラーのhomeアクション
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
