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
})