class UsersController < ApplicationController
  before_action :logged_in_user, only: :show

  def new
    @user = User.new
    respond_to {|format| format.js}
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "static_pages.home.usernotfound"
    redirect_to root_path
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:info] = t "users.create.success"
      redirect_to @user
    else
      flash[:danger] = "users.create.fail"
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
