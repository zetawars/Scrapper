(function($){Drupal.behaviors.flexslider={attach:function(context,settings){var id;var sliders=[];if($.type(settings.flexslider)!=='undefined'&&$.type(settings.flexslider.instances)!=='undefined'){for(id in settings.flexslider.instances){if(settings.flexslider.optionsets[settings.flexslider.instances[id]]!==undefined){if(settings.flexslider.optionsets[settings.flexslider.instances[id]].asNavFor!==''){_flexslider_init(id,settings.flexslider.optionsets[settings.flexslider.instances[id]],context);}else{sliders[id]=settings.flexslider.optionsets[settings.flexslider.instances[id]];}}}}for(id in sliders){_flexslider_init(id,settings.flexslider.optionsets[settings.flexslider.instances[id]],context);}}};function _flexslider_init(id,optionset,context){$('#'+id,context).once('flexslider',function(){$(this).find('ul.slides > li *').removeAttr('width').removeAttr('height');if(optionset){$(this).flexslider($.extend(optionset,{start:function(slider){slider.trigger('start',[slider]);},before:function(slider){slider.trigger('before',[slider]);},after:function(slider){slider.trigger('after',[slider]);},end:function(slider){slider.trigger('end',[slider]);},added:function(slider){slider.trigger('added',[slider]);},removed:function(slider){slider.trigger('removed',[slider]);},init:function(slider){slider.trigger('init',[slider]);}}));}else{$(this).flexslider();}});}}(jQuery));