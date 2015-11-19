### index of questions // homepage ###
get '/questions' do
		@questions = Question.all

		erb :'questions/index'
end

### new ###
get '/questions/new' do
	erb :'questions/new'
end

### create ###
post '/questions' do
	@question = Question.new(title: params[:title], content: params[:content])
	@question.save
	redirect '/questions'
end

### show ###
get '/questions/:id' do
	@question = Question.find(params[:id])
	# session[:question_id] = @question.id
	# @answer = @question.answer
	# @response = @question.response
	erb :'questions/show'
end


