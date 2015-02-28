# ru: Контроллер приложения.
# en: Application controller.
class ReportController < ApplicationController
  # ru: Перед каждым экшном получаем список федеральных округов и границы существующих дат.
  # en: Before actions get list of FOs and restrictions existings dates.
  before_action :get_fos, :get_date_restriction

  # ru: Основной экшн.
  # en: Main action.
  def index
    # ru: Получаем параметры отчёта и сам отчёт по умолчанию: ФО первый в списке и последний
    # месяц, по которому есть данные.
    # en: Get parameters of report and default report: first FO in list, last existing month.
    @report = {
        date: @last_month,
        fo: @fos.first,
        result: get_report_by_filters(@last_month, @fos.first.id)
    }
  end

  # ru: Экшн формирования определенного отчёта.
  # en: Handling certain report.
  def handling
    # ru: Получаем параметры отчёта и сам отчёт по выбранному ФО и месяцу.
    # en: Get parameters of report and report by FO and month.
    @report = {
        date: params[:date],
        fo: Territory.find(params[:territory]),
        result: get_report_by_filters(params[:date], params[:territory])
    }
    # Рендерим страницу index.
    # Render index page.
    render :index
  end

private

  # ru: Получаем список федеральных округов.
  # en: Get the list of FOs.
  def get_fos
    @fos = Territory.get_fos
  end

  # ru: Получаем границы существующих дат.
  # en: Get restrictions existings dates.
  def get_date_restriction
    @first_month = Statistic.find_first_month.to_s.insert(4, '-')[0,7]
    @last_month = Statistic.find_last_month.to_s.insert(4, '-')[0,7]
  end

  # ru: Получаем отчёт по выбранным параметрам.
  # en: Get report by chosen filters.
  def get_report_by_filters(date, territory_fo)
    start_date = date.delete('-').insert(6,'01').to_i
    end_date = date.delete('-').insert(6,'31').to_i
    Statistic.report_by_territory_and_date territory_fo.to_i, start_date, end_date
  end
end