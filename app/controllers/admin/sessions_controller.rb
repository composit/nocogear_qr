class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    if admin = Admin.find_by_username(params[:username]) and admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_entries_url
    else
      redirect_to new_admin_session_url
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to new_admin_session_url, notice: 'You are logged out'
  end
end
