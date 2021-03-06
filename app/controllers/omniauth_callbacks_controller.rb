class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    generic_callback('instagram')
  end

  def twitter
    generic_callback('twitter')
  end

  def facebook
    generic_callback('facebook')
  end

  def generic_callback(provider)
    @identity =Identity.find_for_oauth env["omniauth.auth"]

    @user = @identity.user || current_user
    if @user.nil?
      @user = User.create( email: @identity.email || "")
      @identity.update_attribute(:user_id, @user.id)
    end

    if @user.email.blank? && @identity.email
      @user.update_attributes(:email, @identity.email)
    end


    if @user.persisted?
      @identity.update_attribute(:user_id, @user.id)
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_session_path
    end
  end
end
