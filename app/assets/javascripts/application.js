// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// The following is for prettifying up the tables, after jqueryui makes them butt-crack ugly.
var JTable = function() {};
JTable.Setup = function() {
    var table = $('.jtable');
    $('caption', table).addClass('ui-state-default');
    $('caption', table).css('font-size','20px');
    $('caption', table).css('padding','10px 0 10px');
    $('th', table).addClass('ui-state-default');
    $('th', table).css('padding','5px 0 5px 5px');
    $('td', table).addClass('ui-widget-content');
    $('td', table).css('padding','5px 5px 5px 8px');
    /*$(table).delegate('tr', 'hover', function() {
        $('td', $(this)).toggleClass('ui-state-hover');
    });*/
    /*$(table).delegate('tr', 'click', function() {
        $('td', $(this)).toggleClass('ui-state-highlight');
    });*/
};

JTable.SetupNewRows = function(rows) {
    $(rows).find('td').addClass('ui-widget-content');
};