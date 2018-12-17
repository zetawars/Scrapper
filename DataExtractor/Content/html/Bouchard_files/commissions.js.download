(function ($) {

/**
 * Commissions Data Export
 */
Drupal.behaviors.boisset_commissions_data_export = {
  attach: function (context) {
  if ($('body').hasClass('page-boisset-direct-deposit-export')) {
    $('.export-type-select').change(function() {
      if ($('.export-type-select').val() == 1) {
        $('.bankfile-fields').hide();
      } else {
        $('.bankfile-fields').show();
      }
    });
  }
}  
};
})(jQuery);