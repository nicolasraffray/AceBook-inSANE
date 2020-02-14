require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them with created time" do
    Timecop.freeze # freezes the time
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s)
  end


end