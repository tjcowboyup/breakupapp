# Homepage (Root path)
get '/' do
  erb :index
end

get '/post' do
  erb :post
end
