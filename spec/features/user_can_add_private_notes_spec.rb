require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'When I visit /notes/new' do
    xit "I can create a new note" do
      user_logs_in
      user = User.first

      paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

      visit new_note_path

      fill_in "note[title]", with: "test title"
      select "Granicus", :from => 'create-note-company[]'
      fill_in "body.cke_editable.cke_editable_themed.cke_contents_ltr", with: paragraph
      click_on "Create Note"

      expect(Note.last.status).to eq("private")
      expect(current_path).to eq(notes_path)
      expect(page).to have_content(paragraph)
    end
  end
end
