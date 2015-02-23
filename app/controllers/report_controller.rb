class ReportController < ApplicationController
  before_action :get_fos

  def index
  end

  def handling
    @report = 'There should be a report'
    render :index
  end

  private

  def get_fos
    @fos = Territory.where 'parent_id = ?', 1
  end
end