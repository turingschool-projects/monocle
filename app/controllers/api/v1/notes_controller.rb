class Api::V1::NotesController < ApplicationController

  def index
    @notes = Company.find(params[:id]).notes
    render json: @notes
  end

  def create
    binding.pry
  end
end
