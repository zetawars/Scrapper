(function ($) {
  var token, orderID, cachedCart="", hoverInProgress=false;
  var visible = false;

  Drupal.behaviors.dssuite_cart = {
    attach: function (context) {
      if ($('body').hasClass('purl-active')){
        var pathPrefix="/"+$(location).prop('pathname').split('/')[1]+"/";
      } else{
        var pathPrefix="";
      }
      //Get Path
      function getScriptSourceName(name){
      var scripts = document.getElementsByTagName('script');
      for (i=0;i<scripts.length;i++){
          if (scripts[i].src.indexOf(name) > -1)
              return scripts[i].src;
      }
      }
      var scriptFolder ="";
      var scriptSource=getScriptSourceName('cart.js');
      scriptFolder = scriptSource.substr(0, scriptSource.lastIndexOf( '/' )+1 );
      //Update Cart Quanties on Submit
      $('.commerce-add-to-cart').submit(function(){
      });

      //Reset cart cache on user triggered events
      $('.button-addtocart').click(function(){
        cachedCart="";
      });
      $('.button-quick-view a').click(function(){
        cachedCart="";
      });
      $('.commerce-add-to-cart').submit(function(){
        cachedCart="";
      });
      $('.commerce-add-to-cart-confirmation-close').click(function(){
        cachedCart="";
      });

      //Build Popup Display
      function buildPopup(data){
        if (!visible){
          $('#block-views-shopping-cart-block').append(data);
          cartRowCount = $('#commerce-ajax-cart-preview tbody >tr').length;
          if(cartRowCount > 3){
            $('#commerce-ajax-cart-preview .inner').css('overflow-y','scroll');
          }
          visible=true;
          $('.cart-loading').remove();
        }
        if($(document).width()<=767) {
          $('#commerce-ajax-cart-preview',context).width($(document).width()+'px');
        }
      }

    if($(document).width()>=767) {
      //Trigger popup
      $('.block-shopping-cart-block').click(function(){
        clearTimeout($(this).data('timeoutHover'));
            if(hoverInProgress==false){
              if (!visible){
                $(this).find('.content').addClass('hovered');
                getCustomerCartID();
            }
          }
      });
      $('.block-shopping-cart-block').mouseover(function(){
          clearTimeout($(this).data('timeoutHover'));
              if(hoverInProgress==false){
                if (!visible){
                  $('#block-views-shopping-cart-block').append("<div class='cart-loading'><span>Loading</span> <img src='"+scriptFolder+"boisset-ajax-loader-small.gif'></div>");
                  $(this).find('.content').addClass('hovered');
                  getCustomerCartID();
              }
            }
        });
      $(".block-shopping-cart-block").mouseenter(function(){
          clearTimeout($(this).data('timeoutHover'));
          if(hoverInProgress==false){
            if (!visible){
              $('#block-views-shopping-cart-block').append("<div class='cart-loading'><span>Loading</span> <img src='"+scriptFolder+"boisset-ajax-loader-small.gif'></div>");
              $(this).find('.content').addClass('hovered');
              getCustomerCartID();
            }
          }
      }).mouseleave(function(event){
        if(event.relatedTarget != null){
          var popupElement = $(this),
          timeoutHover = setTimeout(function(){
            $('.hovered').removeClass('hovered');
            $('.cart-loading').remove();
            $('#commerce-ajax-cart-preview').remove();
            visible = false;
          }, 650);
          //set the timeoutId, allowing us to clear this trigger if the mouse comes back over
          popupElement.data('timeoutHover', timeoutHover);
          hoverInProgress=false;
        }
      });
    } else {
      $('.block-shopping-cart-block .content').toggle(function(){
        clearTimeout($(this).data('timeoutHover'));
            if(hoverInProgress==false){
              if (!visible){
                $('#block-views-shopping-cart-block').append("<div class='cart-loading'><span>Loading</span> <img src='"+scriptFolder+"boisset-ajax-loader-small.gif'></div>");
                $('.cart-loading',context).width($(document).width()+'px');
                $(this).find('.content').addClass('hovered');
                getCustomerCartID();


              }
            }
      },function(){
        var popupElement = $(this),
          timeoutHover = setTimeout(function(){
            $('.hovered').removeClass('hovered');
            $('.cart-loading').remove();
            $('#commerce-ajax-cart-preview').remove();
            visible = false;
          }, 650);
          //set the timeoutId, allowing us to clear this trigger if the mouse comes back over
          popupElement.data('timeoutHover', timeoutHover);
          hoverInProgress=false;
      });
    }

  function clearCartCacheTimer(){
    cacheTimer=setInterval(function () {
      cachedCart="";
      clearInterval(cacheTimer);
    }, 3000);
  }

 function getCustomerCartID() {
  if(cachedCart){
    buildPopup(cachedCart);
  } else {
  hoverInProgress=true;
    $.ajax({
    url:"?q=services/session/token",
    type:"get",
    dataType:"text",
    error:function (jqXHR, textStatus, errorThrown) {
    },
    success: function (token) {
      // Call system connect with session token.
      $.ajax({
          url: pathPrefix + '/directsuite/hovercart.jsonp',
          type: "GET",
          dataType: "jsonp",
          contentType : 'application/json',
          beforeSend: function (request) {
            request.setRequestHeader("X-CSRF-Token", token);
          },
          error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
          },
          success: function (data) {
            console.log('new data');
            cachedCart=data;
            buildPopup(data);
            clearCartCacheTimer();
            $('.cart-loading').remove();
          }
        });
      }
    });
  }
}


    }
  };
})(jQuery);