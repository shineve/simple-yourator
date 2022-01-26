class ApplicationController < ActionController::Base
  before_action :user_company, :user_company_id

  private

  def user_company_id
    @user_company_id = 1
  end

  def user_company
    @user_company = Company.find(1)
  end
end
