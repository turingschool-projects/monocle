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

          binding.pry
        # create a couple of notes

        get "/api/v1/notes"

        notes = JSON.parse(response.body)

        expect(response).to be_success
        expect(notes.count).to eq(2)
      end
    end
  end
end
