class Statistic < ActiveRecord::Base
  belongs_to :disease, foreign_key: 'disease_id'
  belongs_to :hospital, foreign_key: 'hospital_id'

  def self.find_first_month
    minimum :date
  end

  def self.find_last_month
    maximum :date
  end

  def self.report_by_territory_and_date(territory_fo, start_date, end_date)
    joins(:disease, hospital: :territory)
    .select('
      territories.name territory_name,
      hospitals.name hospital_name,
      diseases.name disease_name,
      statistics.patients,
      statistics.issued
     ')
    .where('territories.parent_id = ? and statistics.date between ? and ?', territory_fo, start_date, end_date)
  end
end