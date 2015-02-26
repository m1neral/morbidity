class ReportController < ApplicationController
  before_action :get_fos, :get_date_restriction

  def index
    @report = {
        date: @last_month,
        fo: @fos.first,
        result: get_report_by_filters(@last_month, @fos.first.id)
    }
  end

  def handling
    @report = {
        date: params[:date],
        fo: Territory.find(params[:territory]),
        result: get_report_by_filters(params[:date], params[:territory])
    }
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

  def get_report_by_filters(date, territory_fo)
    start_date = date.delete('-').insert(6,'01').to_i
    end_date = date.delete('-').insert(6,'31').to_i
    Statistic.report_by_territory_and_date territory_fo.to_i, start_date, end_date
  end
end