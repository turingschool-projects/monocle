class Api::V1::NotesController < ApplicationController

  def index
    @notes = Company.find(params[:id]).notes
    render json: @notes
  end

  def create
    company = Company.find_by(name: params["company_name"])
    note = Note.new(note_params)
    note.author = current_user.username
    note.user = current_user
    note.company = company
    if note.save
      render json: note
    else
      render json: {message: "Failed to create a note"}
    end
    binding.pry
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
