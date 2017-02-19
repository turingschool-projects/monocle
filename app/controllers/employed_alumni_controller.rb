class EmployedAlumniController < ApplicationController

  def index
    @employees = Employee.all
  end

end
