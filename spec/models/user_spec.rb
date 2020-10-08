require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーサインアップ' do
    context 'サインアップがうまくいく時' do
      it 'nickname, email, password, passwor_confirmation, favorite_car_idが正しい値であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'abc@abc'
        expect(@user).to be_valid
      end
      it 'passwordが8文字以上で、半角英数字混合であれば登録できる' do
        @user.password = '1bc00000'
        @user.password_confirmation = '1bc00000'
        expect(@user).to be_valid
      end
      it 'favorite_car_idが1以外であれば登録できる' do
        @user.favorite_car_id = 2
        expect(@user).to be_valid
      end
    end

    context 'サインアップがうまくいかない時' do
      it 'nicknameが空の時登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nicknameを入力してください')
      end
      it 'emailが空の時登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailを入力してください')
      end
      it 'emailに@が含まれていない時登録できない' do
        @user.email = 'abcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailは不正な値です')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
      end
      it 'passwordが空の時登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordを入力してください')
      end
      it 'passwordが7文字以下の時登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは8文字以上で入力してください')
      end
      it 'passwordは半角英数字混合出なければ登録できない' do
        @user.password = '00000000'
        @user.password_confirmation = '00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Password ConfirmationとPasswordの入力が一致しません')
      end
      it 'favorite_car_idが1の時登録できない' do
        @user.favorite_car_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Favorite carを選択してください')
      end
    end
  end
end
