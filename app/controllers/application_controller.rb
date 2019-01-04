class ApplicationController < ActionController::Base

    def logged_in?
        !!session[:current_user_id]
    end

    def auth
        redirect_to "/users/not_authorized" unless logged_in?
    end

end
