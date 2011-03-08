module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end #of sign_in(user)
  
  def current_user=(user)
    @current_user = user
  end #current_user=(user)
  
  def current_user
    @current_user ||= user_from_remember_token
  end #of current_user
  
  def current_user?(user)
    user == current_user
  end #of current_user?(user)
  
  def signed_in?
    !current_user.nil?
  end #of signed_in?
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end #of sign_out
  
  def authenticate
    deny_access unless signed_in?
  end #of authenticate
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end #of deny_access
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end #of redirect_back_or(default)
  
  private 
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end #user_from_remember_token
    
    def remember_token
      cookies.signed[:remember_token] || [nil,nil]
    end #remember_token
    
    def store_location
      session[:return_to] = request.fullpath
    end #of store_location
    
    def clear_return_to
      session[:return_to] = nil
    end #of clear_return_to
end
