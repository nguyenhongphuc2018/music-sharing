class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    @songs = Song.joins(:category).where(category_id: params[:id])
      .page(params[:page]).per 12 
  end
end