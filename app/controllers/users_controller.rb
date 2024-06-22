class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def destroy
    @user = current_user
    @user.destroy

    session.delete :user_id
    redirect_to root_path, notice: "Profile was successfully deleted"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to the app, #{@user.email}!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    if @current_user && @current_user.id == @user.id
      @articles = current_user.articles
    else
      @articles = @user.articles
    end

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile has been updated"
    else
      render :edit
    end
  end

  def edit
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end