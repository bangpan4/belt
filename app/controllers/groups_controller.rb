class GroupsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @groups = Group.all
  end

  def create
    @groups = Group.new group_params
    unless @groups.save
      flash[:errors] = @groups.errors.full_messages
    end
    redirect_to "/groups"
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy if @group.user === current_user
    redirect_to "/groups"
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, :description).merge(user: current_user)
  end
end
