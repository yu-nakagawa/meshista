class UsersController < ApplicationController
  def index
    #@users=User.all
    
    @users = User.all.paginate(page: params[:page]).search(params[:search])
    
  end
  
  def show
    @user=User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page]).search(params[:search])
  end
  
  def new
  end
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end