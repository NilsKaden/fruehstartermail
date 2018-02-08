class UsersController < ApplicationController

  def index
    @users = User.all
    @sortedUsers = @users.order(birthday: :desc) ## :asc for ascending
    @user = User.new
  end
  
  def show
    redirect_to users_url
  end
  
  def destroy
    User.find(params[:id]).delete
    redirect_to users_url
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to '/users/index'
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_url
    else
      render 'edit'
    end
  end
  
  def sendMail
    @user = User.find(params[:id])
    @user.send_birthday_mail
    puts @user.email
    redirect_to users_url
  end
  private
  
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :birthday)
    end
end
