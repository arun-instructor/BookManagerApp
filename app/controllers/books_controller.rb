class BooksController < ApplicationController
    before_action :authenticate

    def index
        @books = User.find(current_user.id).books
    end

    def create
        book = User.find(current_user.id)
            .books
            .create(book_params)

        if book.valid?
            redirect_to books_path
        else
            flash[:error] = "Book didn't save correctly"
            redirect_to :back
        end
    end

private

    def book_params
        params.require(:book).permit(:title, :author, :release_date, :image)
    end
end
