require "rails_helper"

RSpec.describe ("notes endpoints") do
    context "GET /notes" do
    it "returns all notes for the current user" do
      user_logs_in
      user = User.first
      company = create(:company)

      note_1 = Note.create!(title: "Good company",
                           body: "Maybe apply here",
                           author: user.username,
                           user: user)

      note_2 = Note.create!(title: "Great company",
                           body: "Apply here",
                           author: user.username,
                           user: user)

      company.notes << note_1
      company.notes << note_2

      get "/api/v1/notes"

      notes = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(notes).to be_an(Array)
      expect(notes.count).to eq(2)
    end
  end

  context "POST /notes" do
    it "creates a note for the current user" do
      user_logs_in
      user = User.first
      company = create(:company)

      params = { note: { title: "test title", body: "test body" }, company_names: [company.name] }

      post "/api/v1/notes", params

      note = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(response).to have_http_status(201)

      expect(note[:title]).to eq("test title")
      expect(note[:body]).to eq("test body")
      expect(note[:company_ids]).to eq([company.id])
      expect(note[:company_names]).to eq([company.name])
    end
  end

  context "PUT /notes" do
    it "creates a note for the current user" do
      user_logs_in
      user = User.first
      company = create(:company)
      note = Note.create(title: "test title", body: "test body", user: user)
      note.companies << company

      params = { note: { title: "test title 2", body: "test body 2" }, company_ids: [company.id] }

      put "/api/v1/notes/#{note.id}", params

      note = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(response).to have_http_status(200)

      expect(note[:title]).to eq("test title 2")
      expect(note[:body]).to eq("test body 2")
      expect(note[:company_ids]).to eq([company.id])
      expect(note[:company_names]).to eq([company.name])
    end
  end

  context "DELETE /notes" do
    it "creates a note for the current user" do
      user_logs_in
      user = User.first
      company = create(:company)
      note = Note.create(title: "test title", body: "test body", user: user)
      note.companies << company

      params = {company_name: company.name}

      delete "/api/v1/notes/#{note.id}", params

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(company.notes).to eq([])
    end
  end
end
