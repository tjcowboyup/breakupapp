# Homepage (Root path)
get '/' do
  erb :index
end

get '/post' do
  erb :post
end

get '/testimonials' do
  @recent_sent = SentMessage.recent_messages
  puts @recent_sent[0]
  erb :testimonials
end

get '/add' do
  erb :add
end

post '/post/send' do
  @message_array = Message.generator(params[:checkbox] == "on")
  print @message_array.inspect

  @sent_message = SentMessage.new(
    intro:      @message_array[0].id,
    body:       @message_array[1].id,
    ending:     @message_array[2].id
    )
  
  @sent_message.save
  @message_string = @sent_message.message_maker(params[:recipient], params[:signed_by])
  
  @sent_message.send_sms(params[:recipient_phone], @message_string) 
  @sent_message.send_mail(params[:recipient_email], params[:signed_by], @message_string)

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

