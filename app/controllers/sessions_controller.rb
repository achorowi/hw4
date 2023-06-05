class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"username" => params["username"]})
    if @user 
      if BCrypt::Pasword.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "You are now logged in."
        redirect_to "/"
      else
        flash["notice"] = "Sorry, invalid username or password."
        redirect_to "/places"
      end
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  