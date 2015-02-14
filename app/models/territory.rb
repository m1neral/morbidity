class Territory < ActiveRecord::Base
  has_many :hospitals, foreign_key: 'terr_id'
  belongs_to :parent, class_name: 'Territory', foreign_key: 'parent_id'
end