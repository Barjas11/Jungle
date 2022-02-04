class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  before_filter :authenticate

  def show
    @total_products = Product.count
    @total_categories = Product.group(:category_id).count
  end


  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end

end