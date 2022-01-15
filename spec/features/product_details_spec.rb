require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  RSpec.configure do |config|
    config.use_transactional_fixtures = false
  end

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    scenario "They see product detail" do
      # ACT
      visit root_path
      find_link("Details »", match: :first).click

      # DEBUG
      # commented out b/c it's for debugging only
      save_screenshot
  
      # VERIFY
    expect(page).to have_content 'Description'
    end
  end