(function ($, Drupal) {


  // Submit catalog search form on autocomplete suggestion click
  Drupal.behaviors.autocompleteSupervisor = {
    attach: function (context) {
      $("#boisset-search-catalog-block-form input#edit-keys", context).bind('autocompleteSelect', function(event, node) {
        console.log($(this).val()); // user-entered string
        console.log($(node).data('autocompleteValue')); // key of selected item
        console.log($(node).text()); // label of selected item
        document.getElementById('boisset-search-catalog-block-form').submit();
      });
    }
  };

  Drupal.behaviors.responsive = {
    attach: function (context, settings) {
      // $(document).ready(function() {
      //   $(".left-off-canvas-menu .expanded-by-default > .has-sub-menu").next(".menu").show();
      //   $(".left-off-canvas-menu .expanded-by-default > .has-sub-menu").addClass('slide-opened');
      // });

      // Expand off-canvas menu children
      $(".left-off-canvas-menu .has-sub-menu").unbind().click( function(event) {
        event.preventDefault();
        $(this).toggleClass('slide-opened');
        $(this).next(".menu").slideToggle();
      });

      // $(".block-menu-block-16 .menu .has-sub-menu").unbind().hover( function(event) {
      //   // Nearly identical to left-off-canvas-menu, but allow parents to still link (not toggle)
      //   // also we switch to hover
      //   event.preventDefault();
      //   // $(this).toggleClass('slide-opened');
      //   $(this).next(".menu").show();
      // });


      $(".slide-toggle").once().click(function(event) {
        event.preventDefault(); // Prevent scrolling to the anchor
        $(this).toggleClass('expanded');

        if ($(this).attr("href") != '#') {
          $($(this).attr("href")).slideToggle();
          $($(this).attr("href")).toggleClass('expanded');
        }
        else {
          $($(this).prev(".expandable")).slideToggle();
          $($(this).attr("href")).toggleClass('expanded');
        }

        // Save the label text before we change it to expanded state
        if ($(this).attr("label-within")) {  // Sometimes the show more button is within the clickable container
          if (!$(this).attr("text-label")) {
            $(this).attr("text-label",$(this).find(".within-toggle").text()); // Save the label text before we change it to expanded state
          }
          $(this).find(".within-toggle").html($(this).find(".within-toggle").text() == Drupal.t('Show less') ? $(this).attr("text-label") : Drupal.t('Show less'));
        }
        else {  // But normally the label is the element we're clicking.
          if (!$(this).attr("text-label")) {
            $(this).attr("text-label",$(this).text());
          }
          $(this).html($(this).text() == Drupal.t('Show less') ? $(this).attr("text-label") : Drupal.t('Show less'));
        }


        // Pause all Vimeo video embeds when toggling a container
        if ($(".flex-video").find("iframe").length) {
          $(".flex-video").find("iframe").get(0).contentWindow.postMessage(JSON.stringify({
            "method": "pause",
            "value": "true"
          }), "*");
        }

        // Ignore the button's click event since we have our own functioanlity
        // This comes in handy when it's inside a .trigger-slide-toggle
        event.stopPropagation();
        event.preventDefault();
      });
    }
  };


})(jQuery, Drupal);
