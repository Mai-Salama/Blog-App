class SessionsController < ApplicationController
  def signup

    user = User.new(user_params)

    # if user is saved
    if user.save
      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { token: token }
    else
      # render error message
      render json: { message: "invalid credentials" }
    end
  end

  def login
    user = User.find_by(params.require(:user).permit(:email))

    # you can use bcrypt to password authentication
    if user && user.password == params[:user][:password]

      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { token: token }
    else
      render json: { message: "invalid credentials" }
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

  def logout
    render json: { message: "logged out"}
    redirect_to '/'
  end
end