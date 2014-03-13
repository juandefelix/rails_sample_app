module SessionsHelper

  def sign_in(user)
    # Create a new token
    remember_token = User.new_remember_token

    # Place the token in the cookie
    cookies.permanent[:remember_token] = remember_token

    # Save in the db the hashed remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))

    # Set the current user to 'user' variable
    self.current_user = user
  end
end
