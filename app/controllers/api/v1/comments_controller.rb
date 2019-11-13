module Api
    module V1
        class CommentsController < ApplicationController
            def index
                comments = Comment.all
                render json: comments
            end

            def show
                comment = Comment.find(params[:id])
                render json: comment
            end

            def create
                comment = Comment.create(comment_params)
                render json: comment
            end

            private

            def comment_params
                params.require(:comment).permit(:text, :rating, :image_url, :author, :recipe_id)
            end
        end
    end
end
