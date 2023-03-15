class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    @data = {
      Author: 'Munzambi Ntemo Miguel',
      Date: '2023-03-14 22:05',
      Description: 'Api Rest v1',
      Users: @users
    }
    render json: @data
  end

  # GET /users/1
  def show
    @data = {
      Author: 'Munzambi Ntemo Miguel',
      Date: '2023-03-14 22:05',
      Description: 'Api Rest v1',
      Users: @user
    }
    render json: @data
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      
      @data = {
        Author: 'Munzambi Ntemo Miguel',
        Date: '2023-03-14 22:05',
        Description: 'Api Rest v1',
        Users: @user
      }
      render json: @data, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :description)
    end
end
