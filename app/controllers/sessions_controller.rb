class SessionsController < ApplicationController
  def new
    
  end
  
  def create
   user = User.find_by(email: params[:session][:email].downcase) #find the User object with the email entered by the user. Notice here the use of the params hash with keys session and email, which contains the email address entered by the user. Since all email addresses are stored in lowercase (see the before filter in the User model), the email address entered by the user is converted to lowercase before the search.
   if user && user.authenticate(params[:session][:password])
       log_in user  #this method stores the user id in the session hash => that’s how a user is logged in
       redirect_to user #this redirects to the show action in the Users controller
   else
    flash[:danger] = "email/password combination is not valid" #using the flash utility to indicate that the user’s attempt to log in was not successful.
        render 'new'
   end
  end

 def destroy   #method called when user logs out
     log_out    #this method is implemented in the helper, see below (it removes the user from the session hash and sets the current_user to nil) => that’s how the user is logged out
     redirect_to root_url   #redirects the user to the homepage (whatever is set as your root url on the routes.rb page). Make sure you set it!!
 end


end
