class Admin::EntriesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_entry, only: :show

  def index
    @entries = Entry.all
  end

  def show
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:name, :email, :phone, :description)
    end

    def authenticate_admin
      redirect_to(new_admin_session_url, alert: 'Please sign in') unless current_admin
    end
end
