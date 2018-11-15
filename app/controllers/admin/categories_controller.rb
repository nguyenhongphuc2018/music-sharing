class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: %i(edit update destroy)

  def index
    @categories = Category.select_fields.by_lastest
                          .page(params[:page]).per Settings.show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    @category.user = current_user
    if @category.save
      flash[:success] = t ".add_success", name: @category.name
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t ".create_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".category_update"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    unless @category.songs.any?
      if @category.destroy
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".warning"
      end
    else
      flash[:danger] = t ".has_songs"
    end
    redirect_to admin_categories_path
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".not_found", id: params[:id]
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit :name, :info
  end
end
