class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @users = User.all
    @sortedUsers = @users.order(birthday: :desc)
  end
  
  def delete
  end
  
  def edit
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to '/users/show'
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :birthday)
    end
end
