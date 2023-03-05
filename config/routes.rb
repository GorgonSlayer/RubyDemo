Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/user', controller: 'users', action: :searchUser, constraints: { format: 'js' }
  post '/ask', controller: 'questions', action: :askQuestion
  get  '/questions', controller: 'questions', action: :retrieveQuestions
  post '/answer', controller: 'answers', action: :answerQuestion
  get  '/qa', controller: 'answers', action: :retrieveAnswers
  post '/qbya', controller: 'answers', action: :retrieveAnswersByQuestion
end
