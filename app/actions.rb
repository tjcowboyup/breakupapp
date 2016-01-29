# Homepage (Root path)
get '/' do
  erb :index
end

get '/post' do
  erb :post
end


post '/post/send' do
  @intro = Message.intro_generator(params[:checkbox] == "on")
  @body = Message.body_generator(params[:checkbox] == "on")
  @ending = Message.ending_generator(params[:checkbox] == "on")

  @sent_message = SentMessage.new(
    intro:      @intro.id,
    body:       @body.id,
    ending:     @ending.id
    )

  @sent_message.save

  @message = Message.message_maker(params[:recipient], params[:signed_by], @intro.text, @body.text, @ending.text)
  puts @message.inspect
  
  Message.send_sms(params[:recipient_phone], @message)
  Message.send_mail(params[:recipient], params[:signed_by], @message)

  redirect '/post'
end



  # puts params[:recipient]
  # puts params[:recipient_email]
  # puts params[:recipient_phone]
  # puts params[:signed_by]
  # puts params[:checkbox] == "on"

  # puts @intro.inspect
  # puts @body.inspect
  # puts @ending.inspect
