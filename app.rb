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
  erb(:band)
end

patch('/band/:id/edit') do
  @band = Band.find(params.fetch("id").to_i)
  @band.update({name: params.fetch("name")})
  erb(:band)
end

delete('/band/:id') do
  band = Band.find(params.fetch("id").to_i)
  band.delete
  @bands = Band.all
  erb(:bands)
end
