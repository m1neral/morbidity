class Territory < ActiveRecord::Base
  @@fo = 1 # Федеральный округ - 1

  has_many :hospitals, foreign_key: 'terr_id'
  belongs_to :parent, class_name: 'Territory', foreign_key: 'parent_id'

  def self.find_fos
    where 'parent_id = ?', @@fo
  end
end