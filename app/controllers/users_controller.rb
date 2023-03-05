class UsersController < ApplicationController
  def index
  end

  # Search User searches for a user by that email address and then returns it if found with matching name, 
  # otherwise updates name if different. If nothing is found, it submits a new item.
  def searchUser
    if params[:email].empty? # No email provided
      render(json: {message: "No email provided"}, status: :unprocessable_entity)
    else
      user = findUserByEmail
      if validateNewUser
        if user.nil? #nothing is found, insert a new one.
          newUser = saveNewUser
          render json: {message: "Created new User", user: newUser}, status: :created
        end
      else
        render json: {message: "Valid Email found", user: user.id}, status: :ok
      end
    end
  end

    # Validate a email to ensure it is good
  def validateNewUser
      bool = User.new(name: user_params[:name], email: user_params[:email]).valid?
  end


  # Search for a user by email.
  def findUserByEmail
    user = User.find_by(email: user_params[:email])
  end

  # Save a new User. It should return with errors if this is wrong.
  def saveNewUser
    p = User.create(name: user_params[:name], email: user_params[:email])
  end

  def updateName
    user = User.find_by(email: user_params[:email])
    user.name = user_params[:name]
    user.save
  end

  private

  def user_params
    params.require(:user).permit([:name, :email])
  end

end
