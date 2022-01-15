require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  RSpec.configure do |config|
    config.use_transactional_fixtures = false
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'article.product'
  end

  
end