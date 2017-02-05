require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'When I visit /notes/new' do
    it "I can create a new note" do
      user_logs_in
      user = User.first

      paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

      visit notes_path

      click_on "New Note"
      fill_in "note[company]", with: "Granicus"
      fill_in "note[body]", with: paragraph
      click_on "Create Note"

      expect(current_path).to eq(notes_path)
      expect(page).to have_content(paragraph)
    end
  end
end
