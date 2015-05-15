require "spec_helper"

describe(Band) do
  it("validates the presense of a name") do
    band = Band.new({name: ""})
    expect(band.save).to(eq(false))
  end
end
