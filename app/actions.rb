# Homepage (Root path)
get '/' do
  erb :index
end

get '/post' do
  erb :post
end


post '/post/send' do
    puts params[:recipient]
    puts params[:recipient_email]
    puts params[:recipient_phone]
    puts params[:signed_by]
    puts params[:checkbox] == "on"

    redirect '/post'
  end