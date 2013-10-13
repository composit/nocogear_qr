class Admin::EntriesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_entry, only: :show

  def index
    @entries = Entry.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:name, :email, :phone, :description)
    end

    def authenticate_admin
      redirect_to('/', error: 'Please log in') unless current_user
    end
end
