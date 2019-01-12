(function ($) {
  var orderID;
  var productID;
  var $messagePopup;
  var scriptEls = document.getElementsByTagName( 'script' );
  var thisScriptEl = scriptEls[scriptEls.length - 1];
  var scriptPath = thisScriptEl.src;
  var scriptFolder = scriptPath.substr(0, scriptPath.lastIndexOf( '/' )+1 );
  var $selectedElement;
  var orderData = {};
  var token;
  var lineItemTimeDelayed;
  var pathPrefix;
  var scriptFolder ="";
  //Get Path
  function getScriptSourceName(name){
    var scripts = document.getElementsByTagName('script');
    for (i=0;i<scripts.length;i++){
      if (scripts[i].src.indexOf(name) > -1){
        return scripts[i].src;
      }
    }
  }
  scriptSource=getScriptSourceName('catalog.js');
  scriptFolder = scriptSource.substr(0, scriptSource.lastIndexOf( '/' )+1 );

  window.overlay=false;
  //Preload Message Popup Template
   $.get(scriptFolder+"addtocart.html", function( data ) {
      $messagePopup=$(data);
    });
   //Preload Token
    $.get("?q=services/session/token", function( data ) {
      token=data;
    });

   var $cartQuantityField="<div class='view-footer'><div class='line-item-summary'><div class='line-item-quantity'><span class='line-item-quantity-raw'>0</span> <span class='line-item-quantity-label'>items</span></div></div></div>";
  /**
   * Catalog Scripts
   */
Drupal.behaviors.dssuite_catalog = {
  attach: function (context) {
  var $mp = $messagePopup;

  if ($('body').hasClass('purl-active')){
    pathPrefix="/"+$(location).prop('pathname').split('/')[1]+"/";
  } else{
    pathPrefix="/";
  }

  //Remove Quick View Modal
  $('.page-products-catalogs-wine-club-membership .quick-view-window submit').on('click', function(e){
    var t = new Date();
    lineItemTimeDelayed=t.setSeconds(t.getSeconds() + 3.5);
    Drupal.CTools.Modal.dismiss();
    $('.commerce_add_to_cart_confirmation_overlay').remove();
    window.overlay=false;

  });


  $('.commerce-add-to-cart-confirmation .button a',context).click(function(event){
    /*event.preventDefault();
    presentTime=Date.now();
    //$('.message-inner').append("<div class='cart-loading'><span>Loading</span> <img src='"+scriptFolder+"boisset-ajax-loader-small.gif'></div>")
    $('.commerce-add-to-cart-confirmation .checkout a').replaceWith("<div>Loading...<img src='"+scriptFolder+"boisset-ajax-loader-small.gif'></div>");
    $('.commerce-add-to-cart-confirmation .checkout div').css('color','#9c7424');
    $('.commerce-add-to-cart-confirmation .checkout').css('background','#ffe8a1');
    if(isUndefined(lineItemTimeDelayed)){
      redirectWait=setInterval(function () {
        window.location=pathPrefix+"cart";
        window.clearInterval(redirectWait);
      }, 3500);
    } else {
      if(lineItemTimeDelayed>presentTime){
        var int = self.setInterval(function(){myLoop()},1000);
        function myLoop() {
          if (lineItemTimeDelayed>presentTime){
              stopLoop();
            }
          }
        function stopLoop() {
          window.clearInterval(int);
          window.location=pathPrefix+"cart";
        }
      } else {
        window.location=pathPrefix+"cart";
      }

    }*/
    window.location=pathPrefix+"cart";

   return false;
  });

  // Enable the close link.
  $('.commerce-add-to-cart-confirmation-close').live('click touchend', function(e) {
    e.preventDefault();
    $(this).closest('#messages').remove();
    $('.commerce_add_to_cart_confirmation_overlay').remove();
    window.overlay=false;
  });

  //Close Modal
  $('#modalBackdrop').click(function() {
     Drupal.CTools.Modal.dismiss();
  });
  //Quick Hover Selector
  $('.view-display-products article').on('mouseover', function(e){
    if($(document).width()>=768){
      var quick_view = $(this).find('.quick-view-choices');
      var container_height = $(this).height();
      var container_width = $(this).width();
      var popup_width = $(quick_view).width();
      if ($('body').hasClass('page-products-shop-accessories-153')){
        var x_cord = 65;
        var y_cord = 18;
      } else {
        var x_cord = ((container_width - popup_width)/2);
        var y_cord = (container_height * .2);
      }

      quick_view.css({ 'left': x_cord, 'top': y_cord, 'display': 'block'});
    }

  }).on('mouseout', function(e){
    $('.quick-view-choices').css('display','none');
  });

  //Quick View Clicked
  $('.button-quick-view').on('click touchstart', function(e){
    var display_product_id = $(this).attr("data-product-display-id");
    //If empty or undefined
    if (display_product_id){
      //Fire Ajax call to get quick view data
      $.ajax(
        {
          type:'GET',
          url: '/dssuite/getquickview/ajax/' + display_product_id,
          success: function(data){
            var output = data[1]['arguments'][0];
    
            $.colorbox({html:output});
            $(".quick-view-window form.commerce-add-to-cart").each(function(){
              // $(this).attr("action",window.location.pathname);
            });
            $('.quick-view-window .form-submit').addClass('ajax-processed');
          }
        }
        );
    }
  });


  //Quick Add To Cart Clicked
  $('.button-addtocart').unbind().click(function(e) {
    var t = new Date();
    lineItemTimeDelayed=t.setSeconds(t.getSeconds() + 3);
    if ($(this).data('product-count')>1) {
      $(this).parent().parent().parent().parent().find('.button-quick-view a').click();
    } else if ($('body').hasClass('page-products-catalogs-wine-club-membership')) {
      //$(this).parent().parent().parent().parent().find('form').submit();
      $(this).parent().parent().parent().parent().find('.button-quick-view a').click();
    } else {
      var display_product_id = $(this).attr("data-product-display-id");
      $selectedElement=$(this);
      productID = $($selectedElement).data('product-id');
        getCustomerOrderID(function(returnedData){ //anonymous callback function
      });
    }

  });



function updateCartDisplay(){
  $('body').append("<div class=\"commerce_add_to_cart_confirmation_overlay\"></div>");
  //Populate Template
  $messagePopup.find('.checkout a').attr('href', pathPrefix + 'cart');
  $messagePopup.find('.field-name-field-winery .field-item').text($($selectedElement).parent().parent().parent().find('.field-name-field-winery .field-item').text());
  $messagePopup.find('.added-product-subtitle').text($($selectedElement).parent().parent().parent().find('.field-name-field-subtitle .field-item').text());
  $messagePopup.find('.field-name-field-subtitle .field-item').text($($selectedElement).parent().parent().parent().find('.field-name-title-field .field-item').text());
  $messagePopup.find('.added-product-total').text($($selectedElement).parent().parent().parent().find('.final-price').text());
  $messagePopup.find('.field-name-field-product-image img').attr('src', $($selectedElement).parent().parent().parent().find('.field-name-field-product-image img').attr('src'));
  $('body').prepend($messagePopup);
  var commercePopUp = document.getElementById('commerce-add-to-cart-popup');
  $messagePopup.find('.commerce-add-to-cart-confirmation').attr('style', positionPopupToCenter(commercePopUp.offsetWidth, commercePopUp.offsetHeight));
  //Increase Shopping Cart Quantity
  if ($('.view-empty p').text()=="Empty"){
    cartQuantity=0;
    $(".view-empty").replaceWith($cartQuantityField);
  } else {
    cartQuantity = $('.block-views-shopping-cart-block .view-footer .line-item-summary .line-item-quantity-raw').text();
  }
  cartQuantity=parseInt(cartQuantity);
  cartQuantity++;
  $('.line-item-quantity-raw').text(cartQuantity);
  window.scrollTo(0,0);
}


function positionPopupToCenter(sizewidth, sizeheight) {
    var screenLeft = (window.screen.availWidth / 2) - (sizewidth / 2);
    var screenTop = (window.screen.availHeight / 2) - (sizeheight / 2);
    return 'top: ' + screenTop + 'px; left: ' + screenLeft + 'px; margin-left: 0;';
}


function createLineItem(orderID, productID){
  if (orderID!=null){
    var lineitemData = {
       "quantity":"1",
       "order_id":orderID,
       "commerce_product":productID,
       "type":"product"
      };
    $.ajax({
      url:"?q=services/session/token",
      type:"GET",
      dataType:"text",
      error:function (jqXHR, textStatus, errorThrown) {
        console.log(errorThrown);
      },
      success: function (token) {
        // Call system connect with session token.
        $.ajax({
          beforeSend: function (request) {
            request.setRequestHeader("X-CSRF-Token", token);
          },
          url: '?q=caction/line-item',
          type: "POST",
          dataType: "jsonp",
          contentType : 'application/json',
          data: JSON.stringify(lineitemData),
          error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
          },
          success: function (data) {
          }
        });
     }
  });
  }
}

function createProductLineItem(orderID, productID, callback) {
      $.ajax({
            type: 'GET',
            url: '/caction/order.jsonp',
            data: {
            },
            dataType: "jsonp",
            success: function (data) {
              console.log(data);
                if (Object.keys(data)[0] != null) {

                    data=Object.keys(data)[0];
                } else {
                    getCustomerCartID(function(returnedData){
                    data = returnedData;
                  });
                }
                callback(data);
            }
     });
  }


function getCustomerOrderID(callback) {
  var returned;
  $.ajax({
        type: 'GET',
        url: '/caction/cart.jsonp',
        data: {
        },
        dataType: "jsonp",
        beforeSend: function(){
         updateCartDisplay();
         },
        success: function (data) {
            if (countProperties(data)==1) {
              orderID=Object.keys(data)[0];
              setCartQuantity(data,orderID);
              createLineItem(orderID, productID);
            } else {
              getCustomerCartID(function(returnedData){

              });
            }
            callback(orderID);

        }
  });
  }

function setCartQuantity(data,orderID){

}

function getCustomerCartID(callback) {

$.ajax({
  url:"?q=services/session/token",
  type:"get",
  dataType:"text",
  error:function (jqXHR, textStatus, errorThrown) {
    console.log(errorThrown);
  },
  success: function (token) {
    // Call system connect with session token.
    $.ajax({
      url: '/caction/cart.jsonp',
      type: "POST",
      dataType: "jsonp",
      contentType : 'application/json',
      data: JSON.stringify(orderData),
      beforeSend: function (request) {
        request.setRequestHeader("X-CSRF-Token", token);
      },
      error: function (jqXHR, textStatus, errorThrown) {
        console.log(errorThrown);
      },
      success: function (data) {
        console.log(data);
        orderID=data.order_id;
        createLineItem(orderID, productID);
      }
    });
  }
});
}



  function countProperties(obj) {
    var count = 0;

    for(var prop in obj) {
        if(obj.hasOwnProperty(prop))
            ++count;
    }

    return count;
  }

  function isUndefined(value) {
    return typeof value === 'undefined';
  }

  }
};
})(jQuery);
