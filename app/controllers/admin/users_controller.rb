module Admin
class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@q = Admin::User.ransack(params[:q])
	  @users = @q.result.order(email: :asc).paginate(:page => params[:page], :per_page => 20)
	  authorize @users
	end

	def show
		authorize @user
	end

	def new
    @user = Admin::User.new
    authorize @user
  end

	def edit
		authorize @user
	end

	def create
    @user = Admin::User.new(user_params)
    authorize @user

    if @user.save
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render :new
    end
  end

	def update
		authorize @user
		
		if @user.update(user_params)
		  redirect_to @user, notice: 'user was successfully updated.'
		else
		  render :edit
		end
	end

	def destroy
		authorize @user
		
	  @user.destroy
	  redirect_to admin_users_url, notice: 'User was successfully destroyed.'
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_user
	    @user = Admin::User.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	    params.require(:admin_user).permit(:email, :password, :password_confirmation, :confirmed_at)
	  end

end
end