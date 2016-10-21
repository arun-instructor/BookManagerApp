class SessionsController < ApplicationController
    def new
    end

    def create
        #Step 1: Query DB for user based on email
        #Step 2: If email is not found redirect back to login with an error flash message
        #Step 3: If email is found then authenticate the password
        #Step 4: Redirect to book list

        user = User.find_by(email: params[:email])

        if user
            current_user = user.authenticate(params[:password])

            if current_user
                #Authenticated! Yay!
                session[:current_user] = current_user
                redirect_to books_path
            else
                flash[:error] = "Incorrect password"
                redirect_to :back
            end
        else
            flash[:error] = "Email was not found"
            redirect_to :back
        end
    end
end
