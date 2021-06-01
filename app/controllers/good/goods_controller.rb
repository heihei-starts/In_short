class Good::GoodsController < ApplicationController
  #ログインしてる時だけ、いいね。いいね削除できる。
  before_action :authenticate_user!, only:[:post, :destroy] 
  
  #いいねをpost
  def post
    #いいね 
    #そのユーザーがそれをいいねしてたら、いいねできなくする。
    
      current_user.goods.new(post_params)
      
      if current_user.save
        add_good()
        head :created
      else
        flash[:done] = "いいねされています"
      end
  
    #end
  end

  
  #いいね削除
  def destroy

  end

  #ユーザーごとのいいね表示（ユーザーぺーじで表示する）
  def show
    
  end

  private
    
    #ログインしていなければ、ログインページ
    def check_login
      redirect_to new_user_session_path
    end

    def post_params
      params.permit(:user_id, :mean_id)
    end

    def specific_user
       Mean.find(params[:mean_id])
    end
    
    #meanテーブルのgood +1
    def add_good()
      mean = Mean.find_by(id: params[:mean_id])
      mean.increment!(:good, 1)
    end
    #meanテーブルのgood -1
    def delete_good()
      mean = Mean.find_by(id: params[:mean_id])
      mean.decrement!(:goo, 1)
    end


end
