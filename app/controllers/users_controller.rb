class UserController < ApplicationController
  def edit
    @user = User.find(1)
    #@user = current_user

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @user }
    end
  end
end
