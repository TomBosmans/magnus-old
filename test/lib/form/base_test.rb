require 'test_helper'
require "#{Rails.root}/lib/form/base"

describe Form::Base do
  include FormBook

  describe 'BookForm' do
    it 'has 2 resources' do
      assert_equal 2, FormBook::BookForm.resources.count
    end

    it 'has resource named book' do
      assert FormBook::BookForm.resources.include? 'book'
    end

    it 'has resource named author' do
      assert FormBook::BookForm.resources.include? 'author'
    end

    it 'created attr_accessors for book' do
      assert FormBook::BookForm.new.respond_to?(:book_author) &&
             FormBook::BookForm.new.respond_to?(:book_title)
    end

    it 'created attr_accessors for author' do
      assert FormBook::BookForm.new.respond_to?(:author_first_name) &&
             FormBook::BookForm.new.respond_to?(:author_last_name) &&
             FormBook::BookForm.new.respond_to?(:author_birth_date)
    end

    it 'can assign author and book' do
      author = FormBook::Author.new({first_name: 'Stephan', last_name: 'King'})
      book = FormBook::Book.new({author: author, title: 'Misery'})
      book_form = FormBook::BookForm.new(author: book.author, book: book)
      assert_equal author, book_form.author
      assert_equal book, book_form.book
    end
  end
end

