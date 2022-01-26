class AdminController < ApplicationController
  def index
    @company = Company.find(user_company_id)
    @jobs = @company.jobs
  end
end
