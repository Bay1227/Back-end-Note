class SessionsController < ApplicationController
#   rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
# skip_before_action :user_not_found

  def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :ok
      else 
        render json: { error: "User does not exist!" }, status: :not_found
      end
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
      render status: :ok
    else 
          # session.destroy
      render status: :no_content
    end 
  end

  private

#   def user_not_found
#       render json: { error: "User does not exist!" }, status: :not_found
#   end
end