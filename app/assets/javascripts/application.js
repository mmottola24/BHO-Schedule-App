// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require foundation
//= require moment
//= require_tree .

$(document).ready(function(){
    Foundation.global.namespace = '';
    $(document).foundation();

    $('.datepicker').datepicker({
        'dateFormat': 'yy-mm-dd'
    });
    
    $('.stats-wrapper a').click(function() {
        var self = $(this);
        var date = self.data('date'),
            hour = self.data('hour'),
            rink = self.data('rink'),
            weatherLoaded = self.data('weather_loaded');

        self.parent().find('.content').toggle();

        if (self.hasClass('open')) {
            // CLOSE Stats
            self.addClass('closed').removeClass('open');
            self.find('i').addClass('fa-chevron-down').removeClass('fa-chevron-up');
        } else {
            // OPEN Stats
            self.addClass('open').removeClass('closed');
            self.find('i').removeClass('fa-chevron-down').addClass('fa-chevron-up');

            if (rink == 'Outdoor' && weatherLoaded != '1') {
                // load the map widget if game is outdoor
                get_weather_widget(self.parent(), date, hour);

                self.attr('data-weather_loaded', 1);
            }
        }
    });
});
