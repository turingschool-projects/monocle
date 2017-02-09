require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'relationships' do
    it "belongs to a user" do
      company = create(:company)
      note = Note.new(body: 'test', title:'test', author:'test')
      note.companies << company

      expect(note).to respond_to(:user)
    end
    it "belongs to a company" do
      note = Note.new(body: 'test', title:'test', author:'test', user_id: 1)

      expect(note).to respond_to(:companies)
    end
  end
  context '#get_notes' do
    it "can get notes for a company" do
      company = create(:company)
      user = create(:user)
      note = Note.create!(body: 'test', title:'test', author:'test', user: user)
      note.companies << company

      expect(Note.get_notes(company.id, user)).to eq([note])
    end
    it "gets notes without a company_id" do
      company = create(:company)
      user = create(:user)
      note = Note.create!(body: 'test', title:'test', author:'test', user: user)
      note.companies << company

      expect(Note.get_notes(nil,user)).to eq([note])
    end
  end
end
