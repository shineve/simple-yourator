class AdminController < ApplicationController
  def index
    @company = @user_company
    @jobs = @company.jobs
  end
end
