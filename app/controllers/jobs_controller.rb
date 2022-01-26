class JobsController < ApplicationController
  # def create
  #   @company = Company.find(params[:company_id])
  #   @job = @company.jobs.create(job_params)
  #   redirect_to company_path(@company)
  # end

  # def destroy
  #   @company = Company.find(params[:company_id])
  #   @job = @company.jobs.find(params[:id])
  #   @job.destroy
  #   redirect_to company_path(@company), status: 303
  # end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:company_id, :title)
  end
end
