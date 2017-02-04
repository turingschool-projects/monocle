class MyNotesController < ApplicationController
  def index
    render json: Note.all
  end

  def create
    binding.pry
    private_note = Note.new(private_note_params)
    if private_note.save
      render json: private_note
    else
      render json: {message: "Failed to create a note"}
    end
  end

  private

  def private_note_params
    params.require(:note).permit(:title, :body, :user_id, :author, :company_id)
  end
end
