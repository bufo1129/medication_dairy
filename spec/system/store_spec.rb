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

  describe '店舗ログイン' do
    let(:store) { create(:store) }

    before do
      visit store_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/stores/sign_in'
      end
      it '「Log in」と表示される' do
        expect(page).to have_content 'Log in'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'store[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'store[password]'
      end
      it 'Log inボタンが表示される' do
        expect(page).to have_button 'Log in'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'store[email]', with: store.email
        fill_in 'store[password]', with: store.password
        click_button 'Log in'
      end

      it 'ログイン後のリダイレクト先が、ログインした店舗のトップ画面になっている' do
        expect(current_path).to eq '/'
      end
      it 'ヘッダーに店舗名が表示されている' do
        expect(page).to have_content(store.name)
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'store[email]', with: ''
        fill_in 'store[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/stores/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:store) { create(:store) }

    before do
      visit store_session_path
      fill_in 'store[email]', with: store.email
      fill_in 'store[password]', with: store.password
      click_button 'Log in'
    end

    context 'ヘッダーの表示を確認' do
      it '店舗リンクが表示される: 左上から2番目のリンクが「店舗」である' do
        home_link = find_all('a')[1].native.inner_text
        expect(home_link).to match(/店舗/)
      end
      it '日報リンクが表示される: 左上から3番目のリンクが「日報」である' do
        users_link = find_all('a')[2].native.inner_text
        expect(users_link).to match(/日報/)
      end
      it '投薬記録リンクが表示される: 左上から4番目のリンクが「投薬記録」である' do
        books_link = find_all('a')[3].native.inner_text
        expect(books_link).to match(/投薬記録/)
      end
      it '動物リンクが表示される: 左上から5番目のリンクが「動物」である' do
        books_link = find_all('a')[4].native.inner_text
        expect(books_link).to match(/動物/)
      end
      it 'ログアウトリンクが表示される: 左上から5番目のリンクが「ログアウト」である' do
        logout_link = find_all('a')[5].native.inner_text
        expect(logout_link).to match(/ログアウト/)
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:store) { create(:store) }

    before do
      visit store_session_path
      fill_in 'store[email]', with: store.email
      fill_in 'store[password]', with: store.password
      click_button 'Log in'
      logout_link = find_all('a')[5].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面(「使ってみる」)へのリンクが存在する' do
        expect(page).to have_link '', href: '/home/about'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end

end
