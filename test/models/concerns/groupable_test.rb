# To test the groupable concern independently we use a tmp class Book that has
# the Groupable module included and has an alias_attribute library for group.

require 'test_helper'

describe Groupable do
  let(:library) { FactoryGirl.create(:group, name: :library) }
  let(:book_1) {  Book.create(group: library) }
  let(:book_2) { Book.create(group: library) }

  before(:all) { create_table }
  after(:all) { drop_table }

  describe '.create' do
    it 'responds to create' do
     assert  Book.respond_to? :create
    end

    it 'does not need a group' do
      # Why has `Book.create` library as group?
      book = Book.create(group: nil)
      assert_nil book.group
    end

    it 'can have a group' do
      book = Book.create(group: library)
      assert_equal book.library, library
    end
  end

  describe '.where_group' do
    # Need to call book_1, book_2 before the query, else they are not created.
    let(:book_ids) { [book_1.id, book_2.id] }
    let(:library_book_ids) { Book.order(:id).where_group(library.id).pluck(:id) }

    it 'responds to where_group' do
      assert Book.respond_to? :where_group
    end
    
    it 'returns all books where group equals the id' do
      assert_equal book_ids, library_book_ids
    end

    it 'does not return other books' do
      library_2 = FactoryGirl.create(:group)
      book_3 = Book.create(group: library_2)
      book_4 = Book.create
      assert_equal book_ids, library_book_ids
    end

    it 'can be empty' do
      library_2 = FactoryGirl.create(:group)
      assert Book.where_group(library_2.id).empty?
    end
  end

  describe '#group' do
    it 'responds to group' do
      assert book_1.respond_to? :group
    end

    it 'returns the group' do
      assert_equal book_1.group, library
    end
  end

  describe '#library' do
    it 'responds to library' do
      assert book_1.respond_to? :library
    end
 
    it 'returns the group' do
      assert_equal book_1.library, library
    end
  end

  describe '#group_item' do
    it 'responds to group_item' do
      assert book_1.respond_to? :group_item
    end

    it 'has a group_item' do
      assert book_1.group_item.present?
    end
  end

  describe '#group_item_id' do
    it 'responds to group_item_id' do
      assert book_1.respond_to? :group_item_id
    end

    it 'has a group_item id' do
      assert book_1.group_item_id.present?
    end
  end

  class Book < ApplicationRecord
    include Groupable
    alias_attribute :library, :group
    self.table_name = 'tmp_books'
  end

  def create_table
    ActiveRecord::Base.connection.create_table :tmp_books do |t|
      t.references :group_item
    end
  end

  def drop_table
    ActiveRecord::Base.connection.drop_table :tmp_books
  end
end
