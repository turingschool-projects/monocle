class Api::V1::NotesController < ApplicationController

  before_action :set_company, only: [:update, :destroy]


  def index
    render json: Note.get_notes(params[:company_id], current_user), status: 200
  end


  def create
    note = Note.new(note_params)
    note.author = current_user.username
    note.user = current_user
    if note.save
      get_company_ids.each do |company_id|
        company = Company.find(company_id.to_i)
        company.notes << note
      end
      render json: note, status: 201
    else
      render json: {message: "Failed to create a note"}, status: 400
    end
  end

  def update
    note = Note.find(params[:id])
    if note.update(note_params)
      render json: note, status: 200
    else
      render json: {message: "Failed to update a note"}, status: 400
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    render json: {message: "Successfully deleted."}, status: 200
  end

  private
    def note_params
      params.require(:note).permit(:title, :body, :status)
    end

    def set_company
     @company = Company.find_by(name: params[:company_name])
    end

    def get_company_ids
      params.require(:company_ids)
    end

end
