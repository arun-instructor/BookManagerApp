class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            flash[:success] = "Thanks! Please log in."
            redirect_to "/login"
        else
            flash[:error] = "Something went wrong."
            redirect_to signup_path
        end
    end

private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
