# ru: Модель "Госпиталь" по таблице hospitals
# en: Model "Hospital" by table hospitals
class Hospital < ActiveRecord::Base
  # ru: Описание связей(отношений) по структуре БД
  # en: Description relations by DB structure.
  belongs_to :territory, foreign_key: 'terr_id'
  has_many :statistics, foreign_key: 'hospital_id'
end