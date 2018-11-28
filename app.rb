require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
require('pry')

get ('/') do
  # @message = Favorite.list_all_names
  (erb :input)
end

post ('/list') do

  @message = "this worked"
  binding.pry
  (erb :input)
end

get ('/list/:id') do
  item = params[:id].to_i - 1
  @payload = Favorite.give_me(item)
  @message = "get"
  (erb :output)

end

post ('/list/:id') do
  user_said = params[:reason]
  item = params[:id].to_i - 1
  Favorite.give_me(item).add_reason(user_said)
  @message = "post"
  @payload = Favorite.give_me(item)
  (erb :output)

end

get ('/list/:id/:delete') do
  item = params[:id].to_i - 1
  Favorite.give_me(item).delete_reason(params[:delete].to_i)
  @payload = Favorite.give_me(item)
  @message = "get"
  (erb :output)

end
