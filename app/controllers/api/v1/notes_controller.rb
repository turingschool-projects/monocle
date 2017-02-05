class Api::V1::NotesController < ApplicationController
  def index
    render json: current_user.notes, status: 200
  end

  def create
    note = Note.new(note_params)
    link_to_user_and_company(note)
    if note.save
      render json: note, status: 200
    else
      render json: {message: "Failed to create a note"}, status: 400
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end

    def link_to_user_and_company(note)
      company = Company.find_by(name: params["company_name"])
      note.author = current_user.username
      note.user = current_user
      note.company = company
    end
end
