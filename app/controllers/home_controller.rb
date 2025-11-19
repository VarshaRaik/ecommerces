class HomeController < ApplicationController
  def index
  end

  def logout
    sign_out(current_user)
    redirect_to root_path, notice: "Signed out successfully."
  end
end
