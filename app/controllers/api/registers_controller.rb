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
      #ajaxを使うとき、redirectoでそのままページ遷移できない。:showがなにをさしている？
      render :show, status: :created 
      #ここshowアクションにいかすことができたらかち
      
    else
      #newに飛ばし候。失敗というれレスポンスコードを返し候。
      render :new, status: :unprocessable
    end
  end

  def show
    #どっちか？
    @user = User.find(params[:id])
    render json: @user
  end






  private
  

  def user_params
   params.permit(:name, :email, :password, :password_confirmation)
  end

end
