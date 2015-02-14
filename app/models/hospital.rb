class Hospital < ActiveRecord::Base
  belongs_to :territory, foreign_key: 'terr_id'
  has_many :statistics, foreign_key: 'hospital_id'
end