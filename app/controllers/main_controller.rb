class MainController < ApplicationController
  def index
    @featured_companies = Company.all.sample(5)
    @featured_jobs = Job.all.sample(10)
  end
end
