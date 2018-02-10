require "#{Rails.root}/lib/presenter/base"

class ArticlePresenter < Form::Base
  page :show do
    attribute :title
    attribute :description
    attribute :thumbnail
    attribute :content
  end

  page :index do
    attribute :title
    attribute :description
    attribute :thumbnail
  end
end
