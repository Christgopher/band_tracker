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

describe('the deleting a band path', {:type => :feature}) do
  it('deletes a band') do
    band = Band.create({name: "joe"})
    visit('/bands')
    click_link('Joe')
    click_button('Delete')
    expect(page).not_to have_content("joe")
  end
end

describe('the changing bands path', {:type => :feature}) do
  it('changes a band') do
    band = Band.create({name: "joe"})
    visit('/bands')
    click_link('Joe')
    fill_in("name", :with => "james")
    click_button("Update")
    expect(page).to have_content("James")
  end
end
