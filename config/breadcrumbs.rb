crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ", mypages_path
  parent :root
end

crumb :show_post do |post|
  link post.product_name, post
  parent :root
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypages
end

crumb :identification do
  link "本人情報の登録", identification_mypage_path
  parent :mypages
end

crumb :telephone_number do
  link "電話番号の確認", telephone_number_mypages_path
  parent :mypages
end

crumb :telephone_number do
  link "電話番号の確認", telephone_number_mypages_path
  parent :mypages
end

# crumb :profile do
#   link "プロフィール", edit_mypages_path(@user)
#   parent :mypages
# end

crumb :email_password do
  link "メール/パスワード", email_password_mypages_path
  parent :mypages
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