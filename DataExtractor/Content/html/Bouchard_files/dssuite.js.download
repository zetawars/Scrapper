(function ($, Drupal) {

  // We currently calculate cart qty on page load, but we want to show some
  // cart-not-empty notification immediately when we click an add to cart btn
  Drupal.behaviors.add_to_cart_badge = {
    attach: function (context, settings) {
      $(".ajax-add-cart").click(function(event) {
        updateCartMenuLink();
      });
      $(".ajax-add-cart-button").mousedown(function(event) {
        updateCartMenuLink();
      });
    }
  };

  function updateCartMenuLink() {
    $(".menu--cart").addClass('cart--has-items');
    $(".menu--cart .count").html("!");
  }

  // Add mobile support for autocomplete suggestions, i.e. catalog search
  $('#autocomplete li').on('touchstart', function () {
    $(this).click();
  });

})(jQuery, Drupal);
