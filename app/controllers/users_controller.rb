class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #@user = User.new(username: params[:username], password: params[:password], email: params[:email])

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) 
    @user.update(user_params)
    flash.notice = "User '#{@user.username}' Updated!"
    redirect_to new_user_path(@user)
  end

end
