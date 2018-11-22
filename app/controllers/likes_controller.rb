class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @like = Like.new like_params
    respond_to :js if @like.save
  end

  def destroy
    @like = Like.find_by(user_id: params[:user_id], song_id: params[:song_id])
    respond_to :js if @like.destroy
  end

  private 

  def like_params
    params.permit :user_id, :song_id
  end
end