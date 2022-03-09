class PostsController < ApplicationController
    def index
        @posts = Post.all
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to "/"
        else
            render :index
        end
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to "/"
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end
end
