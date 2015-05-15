require "spec_helper"


describe('the listing bands path', {:type => :feature}) do
  it('adds a list of bands') do
    band = Band.create({name: "black sabbath"})
    visit('/bands')
    expect(page).to have_content(band.name)
  end
end

describe('the adding bands path', {:type => :feature}) do
  it('adds a band') do
    visit('/bands')
    fill_in("name", :with => "black sabbath")
    click_button('Add Band')
    expect(page).to have_content("Black sabbath")
  end
end
