class Admin::BaseController < ApplicationController
  layout "admin/index"
  before_action :admin_required
  include SessionsHelper

  def admin_required
    return if current_user && current_user.admin?
    flash[:warning] = t "admin.warning"
    redirect_to root_url
  end
end
