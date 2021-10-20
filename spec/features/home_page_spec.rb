require 'rails_helper'

#feat block same as 'describe'
RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  #scenario block same as 'it'
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot
  end

end