class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        redirect_to @entry, notice: 'Entry was successfully created.'
      else
        render action: 'new'
      end
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:name, :email, :phone, :description)
    end
end
