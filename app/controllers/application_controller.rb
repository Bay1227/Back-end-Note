class ApplicationController < ActionController::API
  include ActionController::Cookies
  

  def authorized
    return render json:{error: "Not authorized"}, status: :unauthorized

  end 
 end