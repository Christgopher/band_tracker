require "spec_helper"


describe('the adding bands path', {:type => :feature}) do
  it('adds a list of bands') do
    band = Band.create({name: "black sabbath"})
    visit('/bands')
    expect(page).to have_content(band.name)
  end
end
