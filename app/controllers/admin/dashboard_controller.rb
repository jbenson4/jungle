class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.admin_username, password: Rails.application.secrets.admin_password

  def show
  end
end
