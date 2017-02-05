require "rails_helper"

RSpec.describe ("notes endpoints") do
  context "GET /notes" do
    VCR.use_cassette('notes_index') do
      it "returns all notes for the current user" do
        user_logs_in
        user = User.first
        company = Company.create(name: "Test", status: "approved")
        note_1 = Note.create(title: "Good company",
                             body: "Maybe apply here",
                             author: user.username, user: user,
                             company_id: company.id)
        note_2 = Note.create(title: "Great company",
                             body: "Apply here",
                             author: user.username,
                             user: user,
                             company_id: company.id)

        get "/api/v1/notes"

        notes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_success
        expect(notes.count).to eq(2)

        expect(notes.first[:title]).to eq(note_1.title)
        expect(notes.first[:body]).to eq(note_1.body)
        expect(notes.first[:user_id]).to eq(note_1.user_id)
        expect(notes.first[:company_id]).to eq(note_1.company_id)
        
        expect(notes.last[:title]).to eq(note_2.title)
        expect(notes.last[:title]).to eq(note_2.title)
        expect(notes.last[:company_id]).to eq(note_2.company_id)
      end
    end
  end
end
