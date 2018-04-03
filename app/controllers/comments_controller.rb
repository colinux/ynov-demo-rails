class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    comment_params = params.require(:comment).permit(:text)

    @restaurant = Restaurant.find(params[:restaurant_id])

    @new_comment = Comment.new(comment_params)
    @new_comment.user = current_user
    @new_comment.restaurant = @restaurant

    if @new_comment.valid?
      @new_comment.save!

      respond_to do |format|
        format.html {
          flash[:notice] = "Votre commentaire a été enregistré."
          redirect_to restaurant_path(@restaurant)
        }

        format.js
      end
    else
      respond_to do |format|
        format.html {
          render "restaurants/show"
        }
        format.js
      end
    end
  end
end
