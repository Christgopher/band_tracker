require "spec_helper"

describe(Band) do
  it("validates the presense of a name") do
    band = Band.new({name: ""})
    expect(band.save).to(eq(false))
  end

  it("capitalizes the first letter of the name") do
    band = Band.create({name: "black sabbath"})
    expect(band.name).to(eq("Black sabbath"))
  end

  it("adds venues to bands") do
    venue = Venue.new({name: "paramount"})
    band = Band.new({name: "black sabbath"})
    band.venues.push(venue)
    expect(band.venues).to(eq([venue]))
  end
end
