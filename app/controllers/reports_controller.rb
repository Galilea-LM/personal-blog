class ReportsController < ApplicationController
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
  end

  private
  def report_params
    params.require(:report).permit(:reporter, :type, :description)
  end
end
