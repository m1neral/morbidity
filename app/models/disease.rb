# ru: Модель "Болезнь" по таблице diseases
# en: Model "Disease" by table diseases
class Disease < ActiveRecord::Base
  # ru: Описание связей(отношений) по структуре БД
  # en: Description relations by DB structure.
  has_many :statistics, foreign_key: 'disease_id'
end