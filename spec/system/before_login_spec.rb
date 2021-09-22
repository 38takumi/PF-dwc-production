# frozen_string_literal: true

require 'rails_helper'

# topページ関係　ここから
describe 'トップ画面(root_path)のテスト' do
  before do
    visit root_path
  end

  context '表示の確認' do
    it 'トップ画面(root_path)に「スケジュール管理帳」が表示されているか' do
      expect(page).to have_content 'スケジュール管理帳'
    end
    it 'root_pathが"/"であるか' do
      expect(current_path).to eq('/')
    end
    it 'Log inリンクが表示される: 左上から5番目のリンクが「Log in」である' do
      log_in_link = find_all('a')[5].native.inner_text
      expect(log_in_link).to match(/log in/i)
    end
    it 'Log inリンクの内容が正しい' do
      log_in_link = find_all('a')[5].native.inner_text
      expect(page).to have_link log_in_link, href: new_customer_session_path
    end
    it 'Sign Upリンクが表示される: 左上から6番目のリンクが「Sign Up」である' do
      sign_up_link = find_all('a')[6].native.inner_text
      expect(sign_up_link).to match(/sign up/i)
    end
    it 'Sign Upリンクの内容が正しい' do
      sign_up_link = find_all('a')[6].native.inner_text
      expect(page).to have_link sign_up_link, href: new_customer_registration_path
    end
  end

  context 'リンクの内容を確認' do
    subject { current_path }

    it 'Homeを押すと、トップ画面に遷移する' do
      home_link = find_all('a')[1].native.inner_text
      home_link = home_link.delete(' ')
      home_link.gsub!(/\n/, '')
      click_link home_link
      is_expected.to eq '/'
    end
    it 'Aboutを押すと、アバウト画面に遷移する' do
      about_link = find_all('a')[2].native.inner_text
      about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link about_link
      is_expected.to eq '/homes/about'
    end
    it 'sign upを押すと、新規登録画面に遷移する' do
      signup_link = find_all('a')[3].native.inner_text
      signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link signup_link
      is_expected.to eq '/customers/sign_up'
    end
    it 'loginを押すと、ログイン画面に遷移する' do
      login_link = find_all('a')[4].native.inner_text
      login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link login_link
      is_expected.to eq '/customers/sign_in'
    end
  end
end
# topページ関係　ここまで

# aboutページ　ここから
describe 'アバウト画面(homes_about_path)のテスト' do
  before do
    visit homes_about_path
  end

  context '表示の確認' do
    it 'アバウト画面に「カレンダー機能を使ったスケジュール管理アプリです。」が表示されているか' do
      expect(page).to have_content 'カレンダー機能を使ったスケジュール管理アプリです。'
    end
    it '表示内容の確認' do
      expect(current_path).to eq('/homes/about')
    end
  end
end
# aboutページ　ここまで

# ヘッダーのテスト　ここから
describe 'ヘッダーのテスト: ログインしていない場合' do
  before do
    visit root_path
  end

  context '表示内容の確認' do
    it 'Homeリンクが表示される: 左上から1番目のリンクが「Home」である' do
      home_link = find_all('a')[1].native.inner_text
      expect(home_link).to match(/home/i)
    end
    it 'Aboutリンクが表示される: 左上から2番目のリンクが「About」である' do
      about_link = find_all('a')[2].native.inner_text
      expect(about_link).to match(/about/i)
    end
    it 'sign upリンクが表示される: 左上から3番目のリンクが「sign up」である' do
      signup_link = find_all('a')[3].native.inner_text
      expect(signup_link).to match(/sign up/i)
    end
    it 'loginリンクが表示される: 左上から4番目のリンクが「login」である' do
      login_link = find_all('a')[4].native.inner_text
      expect(login_link).to match(/login/i)
    end
  end
end
# ヘッダーのテスト　ここまで

# ユーザー新規登録テスト　ここから
describe 'ユーザー新規登録のテスト' do
  before do
    visit new_customer_registration_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/customers/sign_up'
    end
    it '「Sign up」と表示される' do
      expect(page).to have_content 'Sign up'
    end
    it 'nameフォームが表示される' do
      expect(page).to have_field 'customer[name]'
    end
    it 'emailフォームが表示される' do
      expect(page).to have_field 'customer[email]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'customer[password]'
    end
    it 'password_confirmationフォームが表示される' do
      expect(page).to have_field 'customer[password_confirmation]'
    end
    it 'Sign upボタンが表示される' do
      expect(page).to have_button 'Sign up'
    end
  end

  context '新規登録成功のテスト' do
    before do
      fill_in 'customer[name]', with: Faker::Lorem.characters(number: 10)
      fill_in 'customer[email]', with: Faker::Internet.email
      fill_in 'customer[password]', with: 'password'
      fill_in 'customer[password_confirmation]', with: 'password'
    end

    it '正しく新規登録される' do
      expect { click_button 'Sign up' }.to change(Customer.all, :count).by(1)
    end
    it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
      click_button 'Sign up'
      expect(current_path).to eq '/customers/' + Customer.last.id.to_s
    end
  end
end

describe 'ユーザログイン' do
  let(:customer) { create(:customer) }

  before do
    visit new_customer_session_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/customers/sign_in'
    end
    it '「Log in」と表示される' do
      expect(page).to have_content 'Log in'
    end
    it 'nameフォームが表示される' do
      expect(page).to have_field 'customer[name]'
    end
    it 'emailフォームが表示される' do
      expect(page).to have_field 'customer[email]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'customer[password]'
    end
    it 'Log inボタンが表示される' do
      expect(page).to have_button 'Log in'
    end
  end

  context 'ログイン成功のテスト' do
    before do
      fill_in 'customer[name]', with: customer.name
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'Log in'
    end

    it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
      expect(current_path).to eq '/customers/' + customer.id.to_s
    end
  end

  context 'ログイン失敗のテスト' do
    before do
      fill_in 'customer[name]', with: ''
      fill_in 'customer[email]', with: ''
      fill_in 'customer[password]', with: ''
      click_button 'Log in'
    end

    it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
      expect(current_path).to eq '/customers/sign_in'
    end
  end
end
# ユーザー新規登録テスト　ここまで

# ヘッダーのテスト、ログイン後　ここから
describe 'ヘッダーのテスト: ログインしている場合' do
  let(:customer) { create(:customer) }

  before do
    visit new_customer_session_path
    fill_in 'customer[name]', with: customer.name
    fill_in 'customer[email]', with: customer.email
    fill_in 'customer[password]', with: customer.password
    click_button 'Log in'
  end

  context 'ヘッダーの表示を確認' do
    it 'タイトルが表示される' do
      expect(page).to have_content 'Schedule Books'
    end
    it 'log outリンクが表示される: 左上から4番目のリンクが「logout」である' do
      logout_link = find_all('a')[4].native.inner_text
      expect(logout_link).to match(/logout/i)
    end
  end
end
# ヘッダーのテスト、ログイン後　ここまで

# ログアウトのテスト　ここから
describe 'ユーザログアウトのテスト' do
  let(:customer) { create(:customer) }

  before do
    visit new_customer_session_path
    fill_in 'customer[name]', with: customer.name
    fill_in 'customer[email]', with: customer.email
    fill_in 'customer[password]', with: customer.password
    click_button 'Log in'
    logout_link = find_all('a')[4].native.inner_text
    logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
    click_link logout_link
  end

  context 'ログアウト機能のテスト' do
    it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
      expect(page).to have_link '', href: '/homes/about'
    end
    it 'ログアウト後のリダイレクト先が、トップになっている' do
      expect(current_path).to eq '/'
    end
  end
end
# ログアウトのテスト　ここまで