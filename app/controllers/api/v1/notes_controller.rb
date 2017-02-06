class Api::V1::NotesController < ApplicationController
  def index
    render json: current_user.notes, status: 200
  end

  def create
    note = note_with_user_and_company
    return_response(note)
  end

  def update
    company = Company.find_by(name: params[:company_name])
    note = company.notes.find(params[:id])
    if note.update(note_params)
      render json: note, status: 200
    else
      render json: {message: "Failed to update a note"}, status: 400
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end

    def note_with_user_and_company
      note = Note.new(note_params)
      company = Company.find_by(name: params["company_name"])
      note.author = current_user.username
      note.user = current_user
      note.company = company
      return note
    end

    def return_response(note)
      if note.save
        render json: note, status: 200
      else
        render json: {message: "Failed to create a note"}, status: 400
      end
    end
end
