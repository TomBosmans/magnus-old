# This will setup everything you need to write isolated tests with form objects.
# It will create a tmp db table before the test runs and drop it when it's done.

module FormBook
  extend ActiveSupport::Concern

  included do
    before(:all) { create_table }
    after(:all) { drop_table }
  end

  class Book < ApplicationRecord
    self.table_name = 'tmp_books'
    belongs_to :author, class_name: 'FormBook::Author'
  end

  class Author < ApplicationRecord
    self.table_name = 'tmp_authors'
    has_many :books, class_name: 'FormBook::Book'
  end

  class BookForm < Form::Base
    resource :book do
      field :author
      field :title
    end

    resource :author do
      field :first_name
      field :last_name
    end
  end

  def create_table
    ActiveRecord::Base.connection.create_table :tmp_authors do |t|
      t.string :first_name
      t.string :last_name
    end

    ActiveRecord::Base.connection.create_table :tmp_books do |t|
      t.references :author
      t.string :title
    end
  end

  def drop_table
    ActiveRecord::Base.connection.drop_table :tmp_books
    ActiveRecord::Base.connection.drop_table :tmp_authors
  end
end
