require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #
  before do
    @user = build(:user)
  end

  describe 'register validation' do

    it "name is 織田弾中将信長" do
      expect(@user.name).to eq "織田弾正忠信長"
    end

    /--登録できる --/
    it "can register user" do
      expect(@user.valid?).to eq(true)
    end

    /--名前なし --/
    it "cannot register user without name" do
      @user.name = ""
      expect(@user.valid?).to eq(false)
    
    end
    /--パスワード短し--/
    it "cannnot register user too short password" do
      @user.password = "hei"
      expect(@user.valid?).to eq(false)
    end
    
    /--email 一意性なし --/
    it "cannnot register user for ununiquness " do
      /--後々実装--/
    end

    /--email　短し--/
    it "cannnot register user too short email" do
      /--後々実装--/
    end

    it "password != password_configのため not 登録" do
      /--後々実装--/
    end
    



        
  end    

end
