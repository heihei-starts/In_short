require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #
  before do
    @user = build(:user)
  end

  describe 'name validation' do


    it "can register user" do
      expect(@user.valid?).to eq(true)
    end

    it "cannot register user without name" do
      @user.name = ""
      expect(@user.valid?).to eq(false)
    
    end

        
  end    

end
