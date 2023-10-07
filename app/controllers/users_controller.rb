class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    save_user('User was successfully created.', :new)
  end


  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    @user.assign_attributes(user_params)
    save_user('User was successfully updated.', :edit)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private

  # Saves the user and redirects to the specified path
  def save_user(success_notice, fail_action)
    if @user.save
      redirect_to @user, notice: success_notice
    else
      render fail_action
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Defines the permitted parameters for a user
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :address)
  end
end
