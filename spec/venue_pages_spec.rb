require "spec_helper"


describe('the listing venues path', {:type => :feature}) do
  it('adds a list of venues') do
    venue = Venue.create({name: "artichoke"})
    visit('/venues')
    expect(page).to have_content(venue.name)
  end
end

describe('the adding venues path', {:type => :feature}) do
  it('adds a venue') do
    visit('/venues')
    fill_in("name", :with => "artichoke")
    click_button('Add Venue')
    expect(page).to have_content("Artichoke")
  end
end
