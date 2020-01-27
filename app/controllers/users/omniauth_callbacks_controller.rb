class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google
        #find user from google
      @user = User.find_for_google(request.env['omniauth.auth'])
  
      #checking whether there is a valid user or not and then sign in otherwise redirect to login
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "google") if is_navigational_format?
      else
        session['devise.google_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def facebook
      #find user from google
    @user = User.find_for_facebook(request.env['omniauth.auth'])

    #checking whether there is a valid user or not and then sign in otherwise redirect to login
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "facebook") if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def github
    #find user from google
    @user = User.find_for_github(request.env['omniauth.auth'])

    #checking whether there is a valid user or not and then sign in otherwise redirect to login
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "github") if is_navigational_format?
    else
      session['devise.github_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def twitter
    #find user from google
    @user = User.find_for_twitter(request.env['omniauth.auth'])

    #checking whether there is a valid user or not and then sign in otherwise redirect to login
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "twitter") if is_navigational_format?
    else
      session['devise.twitter_data'] = request.env['omniauth.auth'].except("extra") 
      redirect_to new_user_registration_url
    end
  end
end