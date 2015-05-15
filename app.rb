require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/band') do
  band = Band.create({name: params.fetch("name")})
  @bands = Band.all()
  erb(:bands)
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  @venues = Venue.all

  erb(:band)
end

patch('/band/:id/edit') do
  @band = Band.find(params.fetch("id").to_i)
  @band.update({name: params.fetch("name")})
  @venues = Venue.all
  erb(:band)
end

delete('/band/:id') do
  band = Band.find(params.fetch("id").to_i)
  band.delete
  @bands = Band.all
  erb(:bands)
end

patch("/band/:id") do
  venue_ids = params.fetch("venue_ids")
  @band = Band.find(params.fetch("id").to_i())

  venue_ids.each() do |venue_id|
    venue = Venue.find(venue_id.to_i())
    @band.venues.push(venue)
  end
  @venues = Venue.all()
  erb(:band)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venue') do
  venue = Venue.create({name: params.fetch("name")})
  @venues = Venue.all()
  erb(:venues)
end
