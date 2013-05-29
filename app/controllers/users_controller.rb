class UsersController < ApplicationController
  def edit
    @user = current_user

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @user }
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to :back, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
