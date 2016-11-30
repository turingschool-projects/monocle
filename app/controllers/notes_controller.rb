class NotesController < ApplicationController
  def create
    company = Company.find(params[:company_id])
    note = company.notes.new(note_params)
    note.user_id = current_user.id

    if note.save
      flash[:success] = 'Your note has been added!'
    else
    end
    redirect_to request.referrer
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
