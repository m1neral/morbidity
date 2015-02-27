//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
    $("#datepicker").datepicker({
        format: "yyyy-mm",
        viewMode: "months",
        minViewMode: "months",
        autoclose: true
    });
    $('table').DataTable({
        "iDisplayLength": 25,
        "aaSorting": [],
        "language": {
        "url": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Russian.json" }
    });
})