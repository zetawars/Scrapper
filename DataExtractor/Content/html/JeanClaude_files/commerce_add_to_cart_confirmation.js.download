(function ($) {
  Drupal.behaviors.commerce_add_to_cart_confirmation_overlay = {
    attach:function (context, settings) {
      if ($('.commerce-add-to-cart-confirmation').length > 0) {
        // Scroll to the top of the window so we can definitely see the modal
        window.scrollTo(0,0);
        // Add the background overlay.
        if ($('.commerce_add_to_cart_confirmation_overlay').length<1) {
         $('body').append("<div class=\"commerce_add_to_cart_confirmation_overlay\"></div>");
        }
        Drupal.CTools.Modal.dismiss();
        // Enable the close link.
        $('.commerce-add-to-cart-confirmation-close').live('click touchend', function(e) {
          e.preventDefault();
          $('.commerce-add-to-cart-confirmation').remove();
          $('.commerce_add_to_cart_confirmation_overlay').remove();
        });
      }
    }
  }
})(jQuery);

