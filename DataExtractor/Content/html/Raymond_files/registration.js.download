(function ($) {

/**
 * Distributor Registration Scripts
 */
Drupal.behaviors.boisset_ambassador_registration = {
  attach: function (context) {
    if ($('body').hasClass('page-ambassador-registration')) {
      //Build the Personal Website Address default value as 'firstname.lastname'
      $('.page-ambassador-registration input#edit-first-name.form-text').focusout(function() {
        buildPwa();
      });
      $('.page-ambassador-registration input#edit-last-name.form-text').focusout(function() {
        buildPwa();
      });

      $(document).ready(function() {
        if ($('.page-ambassador-registration input#edit-personal-website-address').val().length === 0) {
          buildPwa();
        }
      });

      $('.page-ambassador-registration input#edit-personal-website-address').focusout(function() {
        scrubPwa();
      });

      $('#boisset-ambassador-registration-form').submit(function() {
        scrubPwa();
      });

      function buildPwa() {
        var first_name = $('.page-ambassador-registration input#edit-first-name.form-text').val().toLowerCase();
        first_name = first_name.replace(/[^a-z0-9]/g, '_');
        var last_name = $('.page-ambassador-registration input#edit-last-name.form-text').val().toLowerCase();
        last_name = last_name.replace(/[^a-z0-9]/g, '_');
        var pwa = $('.page-ambassador-registration input#edit-personal-website-address');
        if (first_name.length > 0 && last_name.length > 0) {
          pwa.val(first_name + '.' + last_name);
        }
        else {
          if (first_name.length > 0) {
            pwa.val(first_name);
          }
          else {
            pwa.val(last_name);
          }
        }
      }

      // Only lowercase letters, underscores, periods, and dashes for the Personal Website Address.
      function scrubPwa() {
        var pwa = $('.page-ambassador-registration input#edit-personal-website-address');
        pwa.val(pwa.val().replace(/[^A-z0-9\.\-]/g, '_').toLowerCase());
      }
    }
  }
};
})(jQuery);