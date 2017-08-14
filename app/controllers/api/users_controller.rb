class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render "api/users/index"
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render "api/users/index", status: 200;
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :is_guest?, :tag, :phone_number)
  end
  
end
