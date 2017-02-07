require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'relationships' do
    it "belongs to a user" do
      note = Note.new(body: 'test', title:'test', author:'test', company_id: 1)

      expect(note).to respond_to(:user)
    end
    it "belongs to a company" do
      note = Note.new(body: 'test', title:'test', author:'test', user_id: 1)

      expect(note).to respond_to(:company)
    end
  end
  it "can get notes for a company" do
    company = create(:company)
    user = create(:user)
    note = Note.create(body: 'test', title:'test', author:'test', user_id: user, company: company)

    expect(note.get_notes(company.id)).to eq(note)
  end
end
