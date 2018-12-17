(function ($) {

/**
 * Distributor Update Scripts
 *
 * Does this do anything?  Neither "boisset_ambassador_update" nor the
 * misspelled "boisset_ambassador_udpate" as used below appear in the codebase.
 */
Drupal.behaviors.boisset_ambassador_udpate = {
  attach: function (context) {
    if ($('body').hasClass('page-user-edit-ambassador-update')) {
      $(document).ready(function() {
      });

      $('.page-user-edit-ambassador-update input#edit-personal-website-address').focusout(function() {
        scrubPwa();
      });

      $('#boisset-ambassador-update-form').submit(function() {
        scrubPwa();
      });

      // Only lowercase letters, underscores, periods, and dashes for the Personal Website Address.
      function scrubPwa() {
        var pwa = $('.page-user-edit-ambassador-update input#edit-personal-website-address');
        pwa.val(pwa.val().replace(/[^A-z0-9\.\-]/g, '_').toLowerCase());
      }
    }
  }
};
})(jQuery);