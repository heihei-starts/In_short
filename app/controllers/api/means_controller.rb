class Api::MeansController < ApplicationController
  #ログインしてるユーザーのみ、投稿できる。
  before_action :authenticate_user!,only:[:post, :new_post]

  def display
    #表示
    #求めるcontentのidを取得.
    p params[:id]
    if params[:id]
      #何もしてない状態から、ここに来た時(idから、idを取得。)
      @content = Content.find_by(id: params[:id])
    else
      #postアクションの後にここに来た時(content_idをidとして、取得。)
      @content = Content.find_by(id: params[:content_id])
    end

    #content_idが同じレコードを全取得
    #@means = Mean.where(content_id: content.id)
    @means= @content.means.order('good DESC')
     
    #ログインユーザーのidを取得
    if user_signed_in?
      @session_id     = form_authenticity_token()
      @current_user_id   = current_user.id
    end
  end


  def new_post
    #投稿ページへ遷移
    #p params[:content_id] 
    #content_idをviewに渡す。
    content_name = Content.find_by(id: params[:content_id])
    @content_name = content_name.content_name
    #p @content_name
    @content_id = params[:content_id]
    #ログインしているユーザーid取得
    @current_user_id = current_user.id
    #p @current_user_id 
    #p @content_id
    #p form_authenticity_token()
  end


  def post
    #投稿
    @mean = Mean.new(mean_params)
    if @mean.save

      #ここからdisplayアクションにリダイレクトする時、content_idをidとして取得して欲しいので、明示
      redirect_to api_path(@mean.content_id), status: :found
    else
      redirect_to root_path, status: :found
    end
  end

  #いいね数
  def display_good
    #パラメーターで、means_idを受け取る
    mean  = Mean.find_by(id: params[:id])
    @good   = mean.good
    p @good 
  end



  private

  def mean_params
    #ここで、content_idを入れる
    params.permit(:meaning, :content_id, :user_id)
  end



end
