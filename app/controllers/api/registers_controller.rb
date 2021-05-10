class Api::RegistersController < ApplicationController
  #登録フォームへ飛ぶ
  def new
    @user = User.new()
  end

  def create
    #フォームからのデータを格納
    @user = User.new(user_params)
    #userモデルのバリデーションに通る場合、showコントローラに飛ぶ
    if @user.save
       redirect_to api_register_path(@user), status: :found
      #ここshowアクションにいかすことができたらかち
    else
      #newに飛ばし。失敗というれレスポンスコードを返す。
      redirect_to api_new_path, status:  :found
    end
  end

  def show
    #どっちか？
    @user = User.find(params[:id])
    
    render formats: :html, status: :ok
  end






  private
  

  def user_params
   params.permit(:name, :email, :password, :password_confirmation)
  end

end
