class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, :uniqueness => true

    private

    def normalise_email
      self.email = email.downcase.titleize
    end
end
