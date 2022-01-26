class Admin::CompaniesController < ApplicationController
  def edit
    @company = @user_company
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      format.html { redirect_to @company }
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def update
    @company = @user_company

    if @company.update(update_company_params)
      format.html { redirect_to edit_admin_company_path(@company) }
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  private

  def company_params
    params.require(:company).permit(:code, :name, :description, :mission, :benefits)
  end

  def update_company_params
    params.require(:company).permit(:name, :description, :mission, :benefits)
  end
end
