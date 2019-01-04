class UsersController < ApplicationController

    before_action :auth, only: :user_feed

    def homepage
        session[:current_user_id] = nil
        session[:guest_id] = nil
    end

    def login
        session[:current_user_id]
        @user = User.new
    end

    def login_post
        p = user_params
        @user = User.find_by(email: p[:email])
        if @user.authenticate(p[:password])
            session[:current_user_id] = @user.id
            redirect_to user_feed_user_path
        else
            redirect_to login_user_path
        end
    end


    def new
        session[:current_user_id]
        @user = User.new
    end

    def create
        p = user_params
        @user = User.new(user_params)

        if @user.save
            session[:current_user_id] = @user.id
            redirect_to user_feed_user_path
        else
            render :new
        end
    end

    def guest
        @user = User.find_by(:email == "guest123@guest.com")
        session[:guest_id] = @user.id
        redirect_to subjects_question_path
    end

    def edit

    end

    def update

    end

    def user_feed
        @user = User.find(session[:current_user_id])
        @posts = Post.all.map do |p|
            p
        end.sort_by! {|p| -p[:id]}
    end

    def delete_user
         @user = User.new
         @users = User.all.select do |u|
            u.id != 1 && u.admin != true
         end
    end

    def delete
        user_ids = params[:user][:id]
        user_ids.shift
        user_ids.each do |u|
            person = User.find(u)
            person.destroy
        end
        redirect_to delete_user_path
    end

    def not_authorized
        
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
