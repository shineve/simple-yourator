class ApplicationController < ActionController::Base
  before_action :user_company

  private

  def user_company
    @user_company = Company.find(Company.ids.first)
  end
end
