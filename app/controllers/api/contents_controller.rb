class Api::ContentsController < ApplicationController

  def index
    @contents = Content.order('created_at DESC')
  end

end
