class BooksController < ApplicationController
  before_action :get_categories

  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id]).decorate
  end
end
