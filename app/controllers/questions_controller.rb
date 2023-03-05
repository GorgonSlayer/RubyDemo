class QuestionsController < ApplicationController
  def index
  end

  # Ask Question Controller. 
  # This first checks that the User email exists, then submits the question if the email is valid.
  def askQuestion
    q = Question.new(title: question_params[:title], body: question_params[:body], user_id: question_params[:user_id])
    if q.valid?
      q.save
      render json: {message: "Created new Question", question: q}, status: :created
    else
      render json: {message: "Invalid or empty question", question: q}, status: :bad_request
    end
  end

    # We search for the email in the User table before a question can be asked
  def retrieveQuestions
    questions = Question.all
    render json: {message: "Question list", questions: questions}, status: :ok
  end

  private 

  def question_params
    params.require(:question).permit([:title, :body, :user_id])
  end
end
