class EmployedAlumniController < ApplicationController

  def index
    @employees = User.joins(:employer)
      .select('users.id as id,
        users.username as username,
        companies.id as company_id,
        companies.name as company_name')
  end

end
