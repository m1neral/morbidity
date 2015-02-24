class ReportController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :get_fos, :get_first_month, :get_last_month

  def index
  end

  def handling
    @report = 'There should be a report'
    render :index
  end

  private

  def get_fos
    @fos = Territory.find_fos
  end

  def get_first_month
    @first_month = Statistic.find_first_month.to_s.insert(4, '-')[0,7]
  end

  def get_last_month
    @last_month = Statistic.find_last_month.to_s.insert(4, '-')[0,7]
  end

end