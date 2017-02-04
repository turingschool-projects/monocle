require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'When I visit /notes/new' do
    it "I can create a new note" do
      user_logs_in
      user = User.first

      paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  Nam purus libero, ornare ac tempus ut, blandit vitae nulla.
                  Aliquam ultrices sit amet elit consequat cursus.
                  In quis lectus ipsum. Donec egestas erat a mi aliquet ultrices."

      visit new_user_company_note_path

      click_on "New Note"
      fill_in :company, with: "Granicus"
      fill_in :note, with: paragraph
      click_on "Create Note"

      expect(current_path).to eq(user_notes_path)
      expect(page).to have_content(paragraph)
    end
  end
end
