//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
    // ru: Виджет Datepicker. Кастомизация: формат строки, вид только по месяцам, автозакрытие.
    // en: Widget Datepicker. Customization: string format and view only by month, enable autoclose.
    $("#datepicker").datepicker({
        format: "yyyy-mm",
        viewMode: "months",
        minViewMode: "months",
        autoclose: true
    });
    // ru: Плагин DataTable для сортировки данных таблицы. Кастомизация: вид 25 строк по умолчанию,
    // отключение страртовой сортировки, подключение русского языка.
    // en: Plug-in DataTable for sorting table data. Customization: start view 25 lines, disable start sorting,
    // connection russian language.
    $('table').DataTable({
        "iDisplayLength": 25,
        "aaSorting": [],
        "language": {
        "url": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Russian.json" }
    });
})