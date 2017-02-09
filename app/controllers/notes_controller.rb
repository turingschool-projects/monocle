class NotesController < ApplicationController

  def index
  end

  def new
    @companies = Company.approved_companies
  end

end
