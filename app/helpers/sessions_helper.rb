module SessionsHelper
    def log_in(user)
    session[:user_id] = user.id  #all this does is store the id of the user who’s logging in into the session hash. A cookie is created
    end

end

def current_user
  if  @current_user.nil? #if the user is not logged in
      @current_user = User.find_by(id: session[:user_id])  #find the user using their id and store it in @current_user
  else
      @current_user #in this case, @current_user already contains the current User object logged in. 
  end
end

def logged_in?
  !current_user.nil?   #return true if the method current_user does not return nil and false otherwise.
end

def log_out
   session.delete(:user_id)   #delete the user_id from the session hash
   @current_user = nil         #set @current_user to nil so we don’t have any @current_user.
end

def current_user?(user)
    user && user == current_user
    
    
end
