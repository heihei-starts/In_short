class Good::GoodsController < ApplicationController
  #ログインしてる時だけ、いいね。いいね削除できる。
  before_action :authenticate_user!, only:[:post, :destroy] 
  #いいねをpost
  def post
    #いいね 
    current_user.goods.create!(post_params)
    head :created
  end

  
  #いいね削除
  def destroy

  end

  #ユーザーごとのいいね表示（ユーザーぺーじで表示する）
  def show
    
  end

  private


    def post_params
      params.permit(:user_id, :mean_id)
    end


end
