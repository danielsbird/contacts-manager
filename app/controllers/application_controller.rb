class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  # Create temporary session
    def log_in(user)
        session[:user_id] = user.id
    end

    # Return true if user is logged in
    def logged_in?
        !current_user.nil?
    end

    # Log out a user
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    # Store user's id and remember token in browser cookies
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # Forgets a persistent session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    # Return current user, if any
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        elsif cookies.signed[:user_id]
            user = User.find_by(id: cookies.signed[:user_id])
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
end
