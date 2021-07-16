require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_readingとfirst_name_reading、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含まないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invaild. Include both letters and numbers", "Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invaild. Include both letters and numbers')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invaild. Include both letters and numbers')
      end
      it 'passwordが全角文字では登録できない' do
        @user.password = "パスワードです"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invaild. Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank", "Last name reading is invaild. Input full-width katakana characters")
      end
      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank", "First name reading is invaild. Input full-width katakana characters")
      end
      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invaild. Input full-width characters")
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invaild. Input full-width characters")
      end
      it 'last_name_readingが全角カタカナでないと登録できない' do
        @user.last_name_reading = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invaild. Input full-width katakana characters")
      end
      it 'first_name_readingが全角カタカナでないと登録できない' do
        @user.first_name_reading = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invaild. Input full-width katakana characters")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

