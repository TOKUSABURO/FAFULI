class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
  protected

  def set_search
    @q = Course.ransack(params[:q])
    @courses = @q.result
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin, :hobbies, :self_introduction, :gender, :skills, :age, :qualification, :profile_image, :profile_image_cache
])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin, :hobbies, :self_introduction, :gender, :skills, :age, :qualification, :user_type, :profile_image, :profile_image_cache
])
  end
end
