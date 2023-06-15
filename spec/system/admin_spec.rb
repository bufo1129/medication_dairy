describe '[管理者] 管理者ログイン前のテスト' do

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end

      it 'フッダーに「管理者の方はこちら」が表示される: 「こちら」の表示がリンクになっている' do
        admin_sign_in_link = find_all('a')[6].native.inner_text
        expect(admin_sign_in_link).to match("こちら")
      end
      it 'こちらのリンクの内容が正しい' do
        admin_sign_in_link = find_all('a')[6].native.inner_text
        expect(page).to have_link admin_sign_in_link, href: admin_session_path
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/home/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/home/about'
      end
    end
  end

  describe '管理者ログイン' do
    let(:admin) { create(:admin) }

    before do
      visit admin_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admin/sign_in'
      end
      it '「管理者Log in」と表示される' do
        expect(page).to have_content '管理者Log in'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'admin[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'admin[password]'
      end
      it 'Log inボタンが表示される' do
        expect(page).to have_button 'Log in'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'Log in'
      end

      it 'ログイン後のリダイレクト先が、管理者のトップ画面になっている' do
        expect(current_path).to eq '/admin'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗し、管理者ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/admin/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:admin) { create(:admin) }

    before do
      visit admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'Log in'
    end

    context 'ヘッダーの表示を確認' do
      it '「管理人ページ」が表示されている' do
        expect(page).to have_content '管理人ページ'
      end
    end
  end

  describe '管理者ログアウトのテスト' do
    let(:admin) { create(:admin) }

    before do
      visit admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'Log in'
      logout_link = find_all('a')[7].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end

end