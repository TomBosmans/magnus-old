class Admin::ArticlesController < Admin::ApplicationController
  def index
    @articles = Article.all
  end
end
