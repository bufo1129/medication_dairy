require 'rails_helper'

describe '[店舗] 店舗ログイン前のテスト' do

  describe '店舗新規登録のテスト' do
    before do
      visit new_store_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/stores/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'store[name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'store[email]'
      end
      it 'postal_codeフォームが表示される' do
        expect(page).to have_field 'store[postal_code]'
      end
      it 'prefecture_codeフォームが表示される' do
        expect(page).to have_field 'store[prefecture_code]'
      end
      it 'address_cityフォームが表示される' do
        expect(page).to have_field 'store[address_city]'
      end
      it 'address_streetフォームが表示される' do
        expect(page).to have_field 'store[address_street]'
      end
      it 'address_buildingフォームが表示される' do
        expect(page).to have_field 'store[address_building]'
      end
      it 'phone_numberフォームが表示される' do
        expect(page).to have_field 'store[phone_number]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'store[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'store[password_confirmation]'
      end
      it 'Sign upボタンが表示される' do
        expect(page).to have_button 'Sign up'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'store[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'store[email]', with: Faker::Internet.email
        fill_in 'store[postal_code]', with: Faker::Address.postcode
        select '東京都', from: 'store[prefecture_code]'
        fill_in 'store[password]', with: 'password'
        fill_in 'store[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'Sign up' }.to change(Store.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できた店舗のトップ画面になっている' do
        click_button 'Sign up'
        expect(current_path).to eq '/'
      end
    end
  end

  # describe 'ユーザログイン' do
  #   let(:user) { create(:user) }

  #   before do
  #     visit new_user_session_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/users/sign_in'
  #     end
  #     it '「Log in」と表示される' do
  #       expect(page).to have_content 'Log in'
  #     end
  #     it 'nameフォームが表示される' do
  #       expect(page).to have_field 'user[name]'
  #     end
  #     it 'passwordフォームが表示される' do
  #       expect(page).to have_field 'user[password]'
  #     end
  #     it 'Log inボタンが表示される' do
  #       expect(page).to have_button 'Log in'
  #     end
  #     it 'emailフォームは表示されない' do
  #       expect(page).not_to have_field 'user[email]'
  #     end
  #   end

  #   context 'ログイン成功のテスト' do
  #     before do
  #       fill_in 'user[name]', with: user.name
  #       fill_in 'user[password]', with: user.password
  #       click_button 'Log in'
  #     end

  #     it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
  #       expect(current_path).to eq '/users/' + user.id.to_s
  #     end
  #   end

  #   context 'ログイン失敗のテスト' do
  #     before do
  #       fill_in 'user[name]', with: ''
  #       fill_in 'user[password]', with: ''
  #       click_button 'Log in'
  #     end

  #     it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
  #       expect(current_path).to eq '/users/sign_in'
  #     end
  #   end
  # end

  # describe 'ヘッダーのテスト: ログインしている場合' do
  #   let(:user) { create(:user) }

  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[name]', with: user.name
  #     fill_in 'user[password]', with: user.password
  #     click_button 'Log in'
  #   end

  #   context 'ヘッダーの表示を確認' do
  #     it 'Bookersリンクが表示される: 左上から1番目のリンクが「Bookers」である' do
  #       home_link = find_all('a')[0].native.inner_text
  #       expect(home_link).to match(/Bookers/)
  #     end
  #     it 'Homeリンクが表示される: 左上から2番目のリンクが「Home」である' do
  #       home_link = find_all('a')[1].native.inner_text
  #       expect(home_link).to match(/Home/)
  #     end
  #     it 'Usersリンクが表示される: 左上から3番目のリンクが「Users」である' do
  #       users_link = find_all('a')[2].native.inner_text
  #       expect(users_link).to match(/Users/)
  #     end
  #     it 'Booksリンクが表示される: 左上から4番目のリンクが「Books」である' do
  #       books_link = find_all('a')[3].native.inner_text
  #       expect(books_link).to match(/Books/)
  #     end
  #     it 'Log outリンクが表示される: 左上から5番目のリンクが「Log out」である' do
  #       logout_link = find_all('a')[4].native.inner_text
  #       expect(logout_link).to match(/Log out/)
  #     end
  #   end
  # end

  # describe 'ユーザログアウトのテスト' do
  #   let(:user) { create(:user) }

  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[name]', with: user.name
  #     fill_in 'user[password]', with: user.password
  #     click_button 'Log in'
  #     logout_link = find_all('a')[4].native.inner_text
  #     logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #     click_link logout_link
  #   end

  #   context 'ログアウト機能のテスト' do
  #     it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
  #       expect(page).to have_link '', href: '/home/about'
  #     end
  #     it 'ログアウト後のリダイレクト先が、トップになっている' do
  #       expect(current_path).to eq '/'
  #     end
  #   end
  # end

end
