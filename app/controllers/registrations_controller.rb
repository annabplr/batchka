class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :beginweek, :groceryshopping, :breakfast, :lunch, :collation, :dinner, :starter, :maincourse, :dessert)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :beginweek, :groceryshopping, :breakfast, :lunch, :collation, :dinner, :starter, :maincourse, :dessert)
  end
end
