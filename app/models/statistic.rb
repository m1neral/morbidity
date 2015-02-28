# ru: Модель "Статистика" по таблице statistics
# en: Model "Statistic" by table statistics
class Statistic < ActiveRecord::Base
  # ru: Описание связей(отношений) по структуре БД
  # en: Description relations by DB structure.
  belongs_to :disease, foreign_key: 'disease_id'
  belongs_to :hospital, foreign_key: 'hospital_id'

  # ru: Поиск первого месяца, по которму есть данные.
  # en: Search first existing month.
  def self.find_first_month
    minimum :date
  end

  # ru: Поиск последнего месяца, по которму есть данные.
  # en: Search last existing month.
  def self.find_last_month
    maximum :date
  end

  # ru: Поиск отчётных данных по ФО и месяцу.
  # en: Search report by filters.
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