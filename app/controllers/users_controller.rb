class UsersController < ApplicationController

  def index
    @users = User.all
    @sortedUsers = @users.order(birthday: :desc) ## :asc for ascending
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])

    @user.send_birthday_mail
    redirect_to users_url
    ## this sends the mail
    ## instead of showing the single user
    ## not very CRUD i guess
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
    @user.save
    @user.birthday_string=@user.birthday.strftime("%d %m")
    if @user.save
      redirect_to users_url
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
  
  private
  
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :birthday)
    end
end
