class Api::MeansController < ApplicationController
  def display
    #表示
    #contentのidを取得。それを、means_idにいれる。
    #meand_idの当てはまるレコードを取得。
    #表示。
    content = Content.find_by(id: params[:id])
    @means = Mean.where(content_id: content.id)
  end

  def post
    #投稿
  end
end
