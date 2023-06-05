class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["first_name"] = params["user"]["first_name"]
    @user["last_name"] = params["user"]["last_name"]
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    session["user_id"] = @user["id"]
    redirect_to "/places"
  end
end
