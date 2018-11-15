class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:update,:show]
  before_action :verify_not_admin!, only: :update

  def show
    @songs = @user.songs
    @albums = @user.albums
  end

  def index
    @users = User.select_fields.by_role.page(params[:page]).per Settings.show
  end

  def update
    if @user.admin?
      flash[:danger] = t ".save_admin"
    else
      @user.update_columns role: params[:role]
      flash[:info] = t ".#{@user.role}", name: @user.name
    end
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "static_pages.home.usernotfound"
    redirect_to root_path
  end

  def verify_not_admin!
    return if params[:role].present? && params[:role].to_sym != :admin
    flash[:danger] = t "users.invalid_action"
    redirect_to admin_users_path
  end
end
