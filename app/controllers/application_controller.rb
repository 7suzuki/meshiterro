class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # ストロングパラメータと同様の機能（ユーザー登録時nameのデータ操作を許可する）
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
