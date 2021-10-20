class UsersController < ApplicationController
  # def index
  #   @user = User.find_by_email(params[:session][:email])
  # end
  def new
  end

  def create
  
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      # puts "error, no valid entry#{user.errors.full_messages}"
      redirect_to '/signup'

    end
  end

    private
    def user_params
      params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation)
    end
end
