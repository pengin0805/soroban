require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it '全ての条件が揃えば登録できる' do
      expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nicknameを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testyahoo.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'last_nameが空と登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last nameを入力してください"
      end
      it 'first_nameが空と登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First nameを入力してください"
      end
      it 'last_nameは半角での入力だと登録できない' do
        @user.last_name = 'ﾎﾘｺｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last nameは全角（漢字・ひらがな・カタカナ）であること"
      end
      it 'first_nameは半角での入力だと登録できない' do
        @user.first_name = 'ﾕｳｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First nameは全角（漢字・ひらがな・カタカナ）であること"
      end
      it 'last_name_kanaが空と登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanaを入力してください"
      end
      it 'first_name_kanaが空と登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanaを入力してください"
      end
      it 'last_name_kanaは半角での入力だと登録できない' do
        @user.last_name_kana = 'ﾎﾘｺｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kanaは全角であること'
      end
      it 'first_name_kanaは半角での入力だと登録できない' do
        @user.first_name_kana = 'ﾎﾘｺｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kanaは全角であること'
      end
    end
  end
end
