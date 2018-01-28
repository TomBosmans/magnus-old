require "#{Rails.root}/lib/form/base"

class ArticleForm < Form::Base
  resource Article do
    field :title
    field :description
    field :thumbnail
    field :content
  end

  validates :article_title, presence: true, length: { maximum: 60 }
  validates :article_description, presence: true, length: { maximum: 280 }
  # validates :thumbnail, presence: true

  def self.create(params)
    form = new(params)
    article = form.valid? ? form.create_article : nil
    yield(form, article) if block_given?
  end

  def self.update(article, params)
    form = new(params)
    updated_article = form.valid? ? form.update(article) : nil
    yield(form, updated_article) if block_given?
  end

  def create_article
    article = Article.new(article_attributes)
    article.save
    article
  end

  def update(article)
    article.attributes = article_attributes
    article.save
    article
  end
end
