class Admin::JobsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to admin_path }
      format.json { head :no_content }
    end
  end

  def edit
    @job = Job.find(params[:id])
    @job.min_salary = number_with_precision(@job.min_salary, precision: 0)
    @job.max_salary = number_with_precision(@job.max_salary, precision: 0)
  end

  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update(update_job_params)
        format.html { redirect_to admin_path }
        # format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @company = @job_company
    @job = Job.new
  end

  def create
    @company = @user_company
    @job = @company.jobs.create(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to admin_path }
        # format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def job_params
    params.require(:job).permit(:company_id, :title, :description, :requirements, :employee_benefits, :min_salary,
                                :max_salary, :currency, :is_active)
  end

  def update_job_params
    params.require(:job).permit(:title, :description, :requirements, :employee_benefits, :min_salary, :max_salary,
                                :currency, :is_active)
  end
end
