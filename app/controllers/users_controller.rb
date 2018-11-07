class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :find_user, except: %i(new create)

  def new
    @user = User.new
    respond_to {|format| format.js}
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "users.create.success"
      redirect_to @user
    else
      flash[:danger] = t "users.create.fail"
      redirect_to root_url
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.edit.profile_updated"
    else
      flash[:danger] = t "users.edit.not_update"
    end
    render :edit
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "static_pages.home.usernotfound"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email,
      :password, :password_confirmation
  end
end
