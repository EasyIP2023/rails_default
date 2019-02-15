class PasswordsController < Devise::PasswordsController
  prepend_before_action :check_captcha, only: [:create,:update]

  private

  def check_captcha
    unless verify_recaptcha
      redirect_back fallback_location: edit_user_password_path
    end
  end

end
