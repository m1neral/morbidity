class Statistic < ActiveRecord::Base
  belongs_to :disease, foreign_key: 'disease_id'
  belongs_to :hospital, foreign_key: 'hospital_id'

  def self.by_disease_and_hospital(disease_id, hospital_id)
    where 'disease_id = :disease_id AND hospital_id = :hospital_id',
          disease_id: disease_id,
          hospital_id: hospital_id
  end

  def self.find_first_month
    minimum :date
  end

  def self.find_last_month
    maximum :date
  end
end