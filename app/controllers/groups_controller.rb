class GroupsController < ApplicationController
  http_basic_authenticate_with name: "jasper", password: ENV["APP_PASSWORD"]
  
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to groups_url
    else
      render 'edit'
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end

  def index
    @groups = Group.all
    @group = Group.new
  end

  def destroy
    Group.find(params[:id]).delete
    redirect_to groups_url
  end
  
  def create
    @group=Group.new(group_params)
    if @group.save
      redirect_to groups_url
    else
      redirect_to groups_url
    end
  end
  
  def create
    @group=Group.new(group_params)
    if @group.save
      redirect_to groups_url
    else
      redirect_to groups_url
    end
  end
  
  private
  
    def group_params
      params.require(:group).permit(:name, :subject, :content, :datum, :activator)
    end
end
