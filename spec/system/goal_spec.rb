# frozen_string_literal: true

# require 'rails_helper'


# 作成中の新規テストです。
# エラー箇所があるので実行しないで下さい。


# describe '投稿のテスト' do
#   let!(:goal) { create(:goal, goal_title:'hoge',goal_description:'goal_description') }
#   describe 'トップ画面(root_path)のテスト' do
#     before do
#       visit root_path
#     end
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