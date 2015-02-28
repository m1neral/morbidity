# ru: Модель "Территория" по таблице territories
# en: Model "Territory" by table territories
class Territory < ActiveRecord::Base
  # ru: Задание константы, равной родительскому идентификатору ФО.
  # en: Define constant of FO's parent id.
  FO_ID = 1 # Федеральный округ - 1

  # ru: Описание связей(отношений) по структуре БД
  # en: Description relations by DB structure.
  has_many :hospitals, foreign_key: 'terr_id'
  belongs_to :parent, class_name: 'Territory', foreign_key: 'parent_id'

  # ru: Поиск федеральных округов.
  # en: Search FOs.
  def self.get_fos
    where 'parent_id = ?', FO_ID
  end
end