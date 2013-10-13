class EntriesController < ApplicationController
  before_action :set_entry, only: :show
  respond_to :html

  def show
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: 'Your submission has been received. Thanks!'
    else
      render action: 'new'
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:name, :email, :phone, :description)
    end
end
