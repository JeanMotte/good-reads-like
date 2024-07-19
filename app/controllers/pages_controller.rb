class PagesController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
  end
end
