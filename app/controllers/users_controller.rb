class UsersController < ApplicationController
  http_basic_authenticate_with name: "jasper", password: ENV["APP_PASSWORD"]

  def index
    @users = User.all
    @sortedUsers = @users.order(birthday: :desc) ## :asc for ascending
    @user = User.new
    @groups = Group.all
    
    @option_string = Group.getOptionString
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
    birthday_string = user_params[:birthday][5..9]
    @user=User.new(user_params.merge(:birthday_string => birthday_string))
    if @user.save
      redirect_to users_url
    else
      redirect_to users_url
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
      params.require(:user).permit(:firstname, :lastname, :email, :birthday, :group_id, :female)
    end
end
