# frozen_string_literal: true

# require 'rails_helper'


# 作成中の新規テストです。
# エラー箇所があるので実行しないで下さい。


# describe '投稿のテスト' do
#   let!(:goal) { create(:goal, goal_title:'hoge',goal_description:'hogehoge') }
#   describe 'トップ画面(root_path)のテスト' do
#     before do
#       visit root_path
#     end

# 追加topページでLog inログインボタンをクリック
# Log inページに遷移しているかどうか
# Name,Email,Passwordをそれぞれ入力
# Log inボタンを押す

# ログイン後はゴール一覧に遷移する
# goal_path(@goal.id)

# 投稿は左の投稿の部分からする
# 投稿後のリダイレクト先は正しいかどうか

# その他表示の確認

#     context '表示の確認' do

#       it 'トップ画面(root_path)に「スケジュール管理帳」が表示されているか' do
#         expect(page).to have_content 'スケジュール管理帳'
#       end
#       it 'root_pathが"/"であるか' do
#         expect(current_path).to eq('/')
#       end
#     end
#   end

#   describe "投稿画面(new_goal_path)のテスト" do
#     before do
#       visit new_goal_path
#     end
#     context '表示の確認' do
#       it 'new_goal_pathが"/goals/new"であるか' do
#         expect(current_path).to eq('/goals/new')
#       end
#       it '投稿ボタンが表示されているか' do
#         expect(page).to have_button '作成する'
#       end
#     end
#     context '投稿処理のテスト' do
#       it '投稿後のリダイレクト先は正しいか' do
#         fill_in 'goal[goal_title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'goal[goal_description]', with: Faker::Lorem.characters(number:20)
#         click_button '作成する'
#         expect(page).to have_current_path goal_path(goal.last)
#       end
#     end
#   end


# 下記は検索の確認用
# RSpec.describe 'ログイン後の動作' do
# <!-- 以降ログインと投稿のテストを行う　ここから -->
#   describe 'ログイン' do
#     it '新規投稿の目標のテキストボックスをクリックしてhogeと記入' do
#       expect(クリックして目標をhogeと記入).to eq hoge
#     end
#   end
#   describe '新規投稿の詳細を記入' do
#     it '新規投稿の詳細のテキストボックスをクリックしてhogehogeと記入' do
#       expect(クリックして詳細をhogehogeと記入).to eq hogehoge
#     end
#   end
# <!-- 以降ログインと投稿のテストを行う　ここまで -->
#   describe '検索の動作確認' do
#     it 'text_field_tagの選択と入力' do
#       fill_in　'text_field_tag', with: 'hoge'
#     end
#     it 'rangeタブの選択と表示確認' do
#       expect(page).to have_select('range', selected: '目標', options: ['ユーザー', '目標', '予定', 'タグ'])
#     end
#     it 'searchタブの選択と表示確認' do
#       expect(page).to have_select('search', selected: '部分一致', options: ['前方一致', '後方一致', '完全一致', '部分一致'])
#     end
#     it '検索の実行' do
#       click_button '検索'
#     end
#   end
# end


#   describe "投稿一覧のテスト" do
#     before do
#       visit goals_path
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content goal.goal_title
#         expect(page).to have_link goal.goal_title
#       end
#     end
#   end

#   describe "詳細画面のテスト" do
#     before do
#       visit goal_path(goal)
#     end
#     context '表示の確認' do
#       it '削除リンクが存在しているか' do
#         expect(page).to have_link 'Destroy'
#       end
#       it '編集リンクが存在しているか' do
#         expect(page).to have_link 'Edit'
#       end
#     end
#     context 'リンクの遷移先の確認' do
#       it '編集の遷移先は編集画面か' do
#         edit_link = find_all('a')[3]
#         edit_link.click
#         expect(current_path).to eq('/goals/' + goal.id.to_s + '/edit')
#       end
#     end
#     context 'goal削除のテスト' do
#       it 'goalの削除' do
#         expect{ goal.destroy }.to change{ Goal.count }.by(-1)
#       end
#     end
#   end

#   describe '編集画面のテスト' do
#     before do
#       visit edit_goal_path(goal)
#     end
#     context '表示の確認' do
#       it '編集前のタイトルと本文がフォームに表示(セット)されている' do
#         expect(page).to have_field 'goal[goal_title]', with: goal.goal_title
#         expect(page).to have_field 'goal[goal_description]', with: goal.goal_description
#       end
#       it '保存ボタンが表示される' do
#         expect(page).to have_button 'Update Goal'
#       end
#     end
#     context '更新処理に関するテスト' do
#       it '更新後のリダイレクト先は正しいか' do
#         fill_in 'list[goal_title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'list[goal_description]', with: Faker::Lorem.characters(number:20)
#         click_button 'Update Goal'
#         expect(page).to have_current_path goal_path(goal)
#       end
#     end
#   end
# end



# ログイン→投稿→検索→検索結果が表示されているか確認→詳細確認→編集→更新→更新内容の確認→その投稿内容を削除→削除されているか確認
# ＊下記は詳細＊
# 投稿した内容の確認、というより編集？
# 詳細ボタンを押す
# 編集ボタンを押す
# 投稿した内容を編集
# タイトルのtestフィールドをクリック
# 内容のtestフィールドをクリック
# 更新ボタンをクリック
