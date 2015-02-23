//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
    $("#datepicker").datepicker({
        format: "mm-yyyy",
        viewMode: "months",
        minViewMode: "months"
    });
})