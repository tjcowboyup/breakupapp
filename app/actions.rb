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

  @intro = Message.where(spice: (params[:checkbox] == "on"), section: "Intro").order("RANDOM()").first
  @body = Message.where(spice: (params[:checkbox] == "on"), section: "Body").order("RANDOM()").first
  @end = Message.where(spice: (params[:checkbox] == "on"), section: "Ending").order("RANDOM()").first

  puts @intro.inspect
  puts @body.inspect
  puts @end.inspect

  @sent_message = SentMessage.new(
    intro:      @intro.id,
    body:       @body.id,
    ending:     @end.id
    )

  # @sent_message.save

  #@message = message_maker(params[:recipient], params[:signed_by], @intro, @body, @end)
  #send_sms(params[:recipient_phone], @message)

  #send email method here!


  redirect '/post'
end