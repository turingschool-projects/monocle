class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :created_at, :status, :company_ids, :company_names

  def company_ids
    object.companies.map do |company|
      company.id
    end
  end
  def company_names
    object.companies.map do |company|
      company.name
    end
  end

end
