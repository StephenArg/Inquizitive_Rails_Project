class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        p = post_params
        p[:user_id] = session[:current_user_id]
        @post = Post.new(p)
        if @post.save
            redirect_to user_feed_user_path
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit
        end
    end

    def comment
        p = comment_params
        p[:post_id] = params[:post][:id]
        p[:user_id] = session[:current_user_id]
        Comment.create(p)
        redirect_to post_path(p[:post_id])
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find(session[:current_user_id])
        @comment = Comment.new
    end

    def delete_comment
        comment = Comment.find(params[:comment_id])
        post = comment.post
        comment.destroy
        redirect_to post
    end

    def delete_post
        post = Post.find(params[:post_id])
        post.destroy
        redirect_to user_feed_user_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :description, :image_url)
    end

    def comment_params
        params.require(:comment).permit(:message)
    end

end
