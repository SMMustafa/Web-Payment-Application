class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update, :index, :show, :destroy]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: :destroy

  
  def index
    @users = User.all
  end
  
#   def payment
#       @user = current_user
#       @recipient = User.find_by(params[:email])
#       transfer = params[:balance]
#       #current_user.balance = User.balance - @transfer
#       @recipient.balance = recipient.balance + transfer
#   end
    
    
  def new
    @user = User.new
  end

  
  def show
    @user = User.find(params[:id])
  end
  
  def create
   @user = User.new(user_params)
    if @user.save
      log_in @user
     flash[:success] = "Welcome, your account was created successfully!"  
       #redirect_to controller: "users", action:'show', id: @user.id 
      redirect_to @user  
    else
      render 'new'  
    end
  end
  
  def edit
   @user = User.find(params[:id]) #extract the user from the all the users with the id stored in the hash params[:id] – this hash is passed to the edit view when the edit link is clicked. 
  end
  
def update
   @user = User.find(params[:id]) #find the existing (logged in) user using their id
   if @user.update (user_params) #if update is successful (notice that we only use the user_params – permitted parameters to update the user)
       flash[:success] = "Profile updated successfully"
       redirect_to @user #if update successful, show the user’s profile (show view)
   else
       render 'edit'    #in case you’re not able to save the changes, send the user to the edit form again so they can try again
   end
end

def destroy
    User.find(params[:id]).destroy
    flash[:success] = "***The user was successfully destroyed***"
    redirect_to users_url
end

private
def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #this limits the parameters passed to name, email, password and password_confirmation, meaning that if the user sends any other data, it will be rejected. This is a very important security feature that protects the application from a variety of attacks. 
end

def logged_in_user
    unless logged_in?
        flash[:danger] = "You are not logged in. Please log-in!"
        redirect_to login_url
    end
end
    
def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
    
end
    
def admin_user
    redirect_to(root_url) unless current_user.admin?
    
end
    
    
    
end
