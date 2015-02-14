class Disease < ActiveRecord::Base
  has_many :statistics, foreign_key: 'disease_id'
end