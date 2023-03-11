class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.search(params[:search])
  end
    
    
  def show
    @user = User.find_by_id(params[:id])
    @followers = @user.followers
    @followees = @user.followees
  end

  def search
    if params[:search].blank?
      @results = User.all
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  def subscribes
    @user = User.find(params[:id])
    @followees = @user.followees
  end

private

def user_params
  params.require(:user).permit(:name, :email, :id, :search)
end

end