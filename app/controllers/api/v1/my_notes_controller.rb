class Api::V1::MyNotesController < ApplicationController

  def index
    render json: Note.all
  end
end
