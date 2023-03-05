class AnswersController < ApplicationController
  def index
  end

  # Answers a question, matches against the Question key and the User key.
  def answerQuestion
    a = Answer.new(body: answer_params[:body], user_id: answer_params[:user_id], question_id: answer_params[:question_id])
    if a.valid?
      a.save
      render json: {message: "Answer submitted!", answer: a}, status: :ok
    else
      render json: {message: "Invalid Answer submitted"}, status: :bad_request
    end
  end

  # Retrieves all questions then grabs their answers.
  def retrieveAnswers
    questions = Question.all
    answers = Answer.all
    render json: {message: "Questions and Answers retrieved!", questions: questions, answers: answers}, status: :ok
  end

  # Retrieve the answers to a specific question.
  def retrieveAnswersByQuestion
    answers = Answer.find(params[:question_id])
    if answers.nil?
      render json: {message: "No Answers found!"}, status: :no_content
    else
      render json: {message: "Answers retrieved!", answer: answers}, status: :ok
    end
  end

  private

  def answer_params
    params.permit([:body, :question_id, :user_id])
  end

end
