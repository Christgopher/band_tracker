require "spec_helper"

describe(Venue) do
  it("validates the presense of a name") do
    venue = Venue.new({name: ""})
    expect(venue.save).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    venue = Venue.create({name: "artichoke"})
    expect(venue.name).to(eq("Artichoke"))
  end

  it("adds bands to venues") do
    venue = Venue.new({name: "paramount"})
    band = Band.new({name: "black sabbath"})
    venue.bands.push(band)
    expect(venue.bands).to(eq([band]))
  end
end
