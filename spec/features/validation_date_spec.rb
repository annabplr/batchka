require 'rails_helper'

feature 'User adds a date', js: true do
  context 'for a new menu' do
    scenario 'he connects to batchka and wants to create a menu' do
      visit new_user_session_path
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      visit menus_path
      click_button

      expect(page).to have_content("Merci de")
    end
  end
end
