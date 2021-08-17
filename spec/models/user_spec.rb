require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      end
    end

    context '新規登録できないとき' do
    end

  end
end


#nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる
#nicknameが6文字以下であれば登録できる
#passwordとpassword_confirmationが6文字以上であれば登録できる
#nicknameが空では登録できない
#emailが空では登録できない
#passwordが空では登録できない
#passwordとpassword_confirmationが不一致では登録できない
#nicknameが7文字以上では登録できない
#重複したemailが存在すれば登録できない
#passwordが5文字以下では登録できない
#nicknameが空では新規登録できない
#nicknameが7文字以上では登録できない
#nicknameが6文字以下なら登録できる