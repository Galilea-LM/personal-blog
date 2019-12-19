class Admin::ReportsController < ApplicationController
  def edit
    @report = Report.find(params[:id])
  end

  def index
    @reports = Report.all
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to admin_reports_path
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.delete
      redirect_to admin_reports_path
    else
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(:type, :description)
  end
end
