crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ", mypage_path(current_user)
  parent :root
end

crumb :show_post do |post|
  link post.product_name, post
  parent :root
end

crumb :logout do
  link "ログアウト", logout_mypage_path(current_user)
  parent :mypages
end

crumb :identification do
  link "本人情報の登録", identification_mypage_path(current_user)
  parent :mypages
end

crumb :telephone_number do
  link "電話番号の確認",  telephone_number_mypage_path(current_user)
  parent :mypages
end

crumb :profile do
  link "プロフィール", profile_mypage_path(current_user)
  parent :mypages
end

crumb :email_password do
  link "メール/パスワード",  edit_user_registration_path(current_user)
  parent :mypages
end

crumb :listing do
  link "出品した商品 - 出品中",   listing_mypage_path(current_user)
  parent :mypages
end

crumb :in_transaction do
  link "出品した商品 - 取引中",   in_transaction_mypage_path(current_user)
  parent :mypages
end

crumb :completed_transaction do
  link "出品した商品 - 売却済み",   completed_transaction_mypage_path(current_user)
  parent :mypages
end

crumb :purchase do
  link "購入した商品 - 取引中",   purchase_mypage_path(current_user)
  parent :mypages
end

crumb :purchased do
  link "購入した商品 - 過去の取引",    purchased_mypage_path(current_user)
  parent :mypages
end

crumb :edit_address_delivery do
  link "発送元・お届け先住所変更",    edit_address_delivery_profile_path(current_user)
  parent :mypages
end

crumb :confirmation do
  link "支払い方法",    confirmation_credit_card_path(current_user)
  parent :mypages
end

crumb :search do
  link params["keyword"], search_post_path(current_user)
  parent :root
end

crumb :categories do
  link "カテゴリー一覧",    categories_path(current_user)
  parent :root
end
  


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).