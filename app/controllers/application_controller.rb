class ApplicationController < ActionController::Base
  before_action :user_company

  private

  def user_company
    @user_company = Company.all.sample(1)
  end
end
