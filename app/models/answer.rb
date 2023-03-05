class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  #Validator
  validates :body, presence: true, length: { minimum: 10 }

end
