# Homepage (Root path)
get '/' do
  erb :index
end

get '/post' do
  erb :post
end

get '/testimonials' do
  erb :testimonials
end

get '/add' do
  erb :add
end

post '/post/send' do
  @message_array = Message.generator(params[:checkbox] == "on")
  @sent_message = SentMessage.new(
    intro:      @message_array[0].id,
    body:       @message_array[1].id,
    ending:     @message_array[2].id
    )
  
 
  @sent_message.save
  @message_string = @sent_message.message_maker(params[:recipient], params[:signed_by], @sent_message.intro, @sent_message.body, @sent_message.ending)
  
<<<<<<< HEAD
  @sent_message.send_sms(params[:recipient_phone], @message_string)
  redirect '/post'
end
=======
  Message.send_sms(params[:recipient_phone], @message) unless params[:recipient_phone].empty?
  Message.send_mail(params[:recipient_email], params[:signed_by], @message)

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
>>>>>>> 503692b5d2d09f0cbae61886668e26a565a2c859
