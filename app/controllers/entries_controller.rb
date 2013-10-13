class EntriesController < ApplicationController
  respond_to :html

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to "/", notice: 'Your submission has been received. Thanks!'
    else
      render action: 'new'
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:name, :email, :phone, :description)
    end
end
