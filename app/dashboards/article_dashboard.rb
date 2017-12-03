require "#{Rails.root}/lib/dashboard/base"

class ArticleDashboard < Dashboard::Base
  attribute title: :string, description: :string

  index_page :title, :description
  show_page :title, :description
  edit_page :title, :description
  new_page :title, :description
end
