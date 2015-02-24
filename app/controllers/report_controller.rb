class ReportController < ApplicationController
  before_action :get_fos, :get_date_restriction

  def index
  end

  def handling
    @report = 'There should be a report'
    #date = params[:date].delete '-'
    #fo = params[:territory]
    #render text: fo
    render :index
  end

private

  def get_fos
    @fos = Territory.get_fos
  end

  def get_date_restriction
    @first_month = Statistic.find_first_month.to_s.insert(4, '-')[0,7]
    @last_month = Statistic.find_last_month.to_s.insert(4, '-')[0,7]
  end

end