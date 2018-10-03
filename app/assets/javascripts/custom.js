$(function() {
  var url = document.location.toString();
  if (url.match('#')) {
      $('.nav-pills a[href="#' + url.split('#')[1] + '"]').tab('show');
  } 

  $('.nav-pills a').on('shown.bs.tab', function (e) {

    if(history.pushState) {
    history.pushState(null, null, e.target.hash);
    }
    else {
        location.hash = e.target.hash;
    }

  })
});



$(function() {
  $('.m-select2').select2();
});


$(function() {
  // allart message options
  toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": false,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "3000",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };
});



$(function() {
    // owl carousel
    var options = {
        items: 1,
        margin: 10,
        loop: true,
        nav: true,
        animateOut: 'fadeOut',
        navText: []
    }

    $('.owl-carousel').each(function(){
        $(this).owlCarousel(options);
    });
});



// For assets data form -> type models
$(function() {
  var models;
  models = $('#data_asset_model_asset_id').html();
  return $('#data_asset_type_asset_id').change(function() {
    var type, escaped_type, options;
    type = $('#data_asset_type_asset_id :selected').text();
    escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(models).filter("optgroup[label=" + escaped_type + "]").html();
    if (options) {
      return $('#data_asset_model_asset_id').html(options);
    } else {
      return $('#data_asset_model_asset_id').html(models);
    }
  });
});


// // For assets request form -> type models
// $(function() {
//   var models;
//   models = $('#request_asset_model_asset_id').html();
//   return $('#request_asset_type_asset_id').change(function() {
//     var type, escaped_type, options;
//     type = $('#request_asset_type_asset_id :selected').text();
//     escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
//     options = $(models).filter("optgroup[label=" + escaped_type + "]").html();
//     if (options) {
//       return $('#request_asset_model_asset_id').html(options);
//     } else {
//       return $('#request_asset_model_asset_id').html(models);
//     }
//   });
// });


// For assets data form -> province sites
$(function() {
  var sites;
  sites = $('#data_asset_site_asset_id').html();
  return $('#data_asset_province_asset_id').change(function() {
    var province, escaped_province, options;
    province = $('#data_asset_province_asset_id :selected').text();
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(sites).filter("optgroup[label=" + escaped_province + "]").html();
    if (options) {
      return $('#data_asset_site_asset_id').html(options);
    } else {
      return $('#data_asset_site_asset_id').html(sites);
    }
  });
});



// For withdraw_asset form -> Transfer province sites To
$(function() {
  var sites;
  sites = $('#transfer_asset_site_asset_to_id').html();
  return $('#transfer_asset_province_asset_to_id').change(function() {
    var province, escaped_province, options;
    province = $('#transfer_asset_province_asset_to_id :selected').text();
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(sites).filter("optgroup[label=" + escaped_province + "]").html();
    if (options) {
      return $('#transfer_asset_site_asset_to_id').html(options);
    } else {
      return $('#transfer_asset_site_asset_to_id').html(sites);
    }
  });
});


// For withdraw_asset form -> Withdraw province sites To
$(function() {
  var sites;
  sites = $('#withdraw_asset_site_asset_to_id').html();
  return $('#withdraw_asset_province_asset_to_id').change(function() {
    var province, escaped_province, options;
    province = $('#withdraw_asset_province_asset_to_id :selected').text();
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(sites).filter("optgroup[label=" + escaped_province + "]").html();
    if (options) {
      return $('#withdraw_asset_site_asset_to_id').html(options);
    } else {
      return $('#withdraw_asset_site_asset_to_id').html(sites);
    }
  });
});



// For assets data search -> type models
$(function() {
  var models;
  models = $('#q_model_asset_id_eq').html();
  return $('#q_type_asset_id_eq').change(function() {
    var type, escaped_type, options;
    type = $('#q_type_asset_id_eq :selected').text();
    escaped_type = type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = "<option value=''>Model: Any</option>" + $(models).filter("optgroup[label=" + escaped_type + "]").html();
    if (options) {
      return $('#q_model_asset_id_eq').html(options);
    } else {
      return $('#q_model_asset_id_eq').html(models);
    }
  });
});


// For assets data search -> province sites
$(function() {
  var sites;
  sites = $('#q_site_asset_id_eq').html();
  return $('#q_province_asset_id_eq').change(function() {
    var province, escaped_province, options;
    province = $('#q_province_asset_id_eq :selected').text();
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = "<option value=''>Site: Any</option>" + $(sites).filter("optgroup[label=" + escaped_province + "]").html();
    if (options) {
      return $('#q_site_asset_id_eq').html(options);
    } else {
      return $('#q_site_asset_id_eq').html(sites);
    }
  });
});


// For fuel data search -> province sites
$(function() {
  var sites;
  sites = $('#q_site_asset_id_eq').html();
  return $('#q_site_asset_province_asset_id_eq').change(function() {
    var province, escaped_province, options;
    province = $('#q_site_asset_province_asset_id_eq :selected').text();
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = "<option value=''>Site: Any</option>" + $(sites).filter("optgroup[label=" + escaped_province + "]").html();
    if (options) {
      return $('#q_site_asset_id_eq').html(options);
    } else {
      return $('#q_site_asset_id_eq').html(sites);
    }
  });
});


// -------------------------------


// For transfer assets 
$(function() {

  if(($('#transfer_asset_transfer_status_accepted').is(':checked')) && ($('#transfer_asset_transfer_status_refused').is(':not(:checked)'))) {
    $('.transfer_accepted_fields').show();
    $('.transfer_refused_fields').hide();
  } else if(($('#transfer_asset_transfer_status_accepted').is(':not(:checked)')) && ($('#transfer_asset_transfer_status_refused').is(':checked'))) {
    $('.transfer_refused_fields').show();
    $('.transfer_accepted_fields').hide();
  } else if(($('#transfer_asset_transfer_status_accepted').is(':not(:checked)')) && ($('#transfer_asset_transfer_status_refused').is(':not(:checked)'))) {
    $('.transfer_refused_fields').hide();
    $('.transfer_accepted_fields').hide();
  }

  $('input[name="transfer_asset[transfer_status]"]').change(function() {
    if(($('#transfer_asset_transfer_status_accepted').is(':checked')) && ($('#transfer_asset_transfer_status_refused').is(':not(:checked)'))) {
      $('.transfer_accepted_fields').show();
      $('.transfer_refused_fields').hide();
    } else if(($('#transfer_asset_transfer_status_accepted').is(':not(:checked)')) && ($('#transfer_asset_transfer_status_refused').is(':checked'))) {
      $('.transfer_refused_fields').show();
      $('.transfer_accepted_fields').hide();
    } else if(($('#transfer_asset_transfer_status_accepted').is(':not(:checked)')) && ($('#transfer_asset_transfer_status_refused').is(':not(:checked)'))) {
      $('.transfer_refused_fields').hide();
      $('.transfer_accepted_fields').hide();
    }
  });

});


// -------------------------------

// For request assets 
$(function() {

  if(($('#request_asset_request_status_accepted').is(':checked')) && ($('#request_asset_request_status_refused').is(':not(:checked)'))) {
    $('.request_accepted_fields').show();
    $('.request_refused_fields').hide();
  } else if(($('#request_asset_request_status_accepted').is(':not(:checked)')) && ($('#request_asset_request_status_refused').is(':checked'))) {
    $('.request_refused_fields').show();
    $('.request_accepted_fields').hide();
  } else if(($('#request_asset_request_status_accepted').is(':not(:checked)')) && ($('#request_asset_request_status_refused').is(':not(:checked)'))) {
    $('.request_refused_fields').hide();
    $('.request_accepted_fields').hide();
  }

  $('input[name="request_asset[request_status]"]').change(function() {
    if(($('#request_asset_request_status_accepted').is(':checked')) && ($('#request_asset_request_status_refused').is(':not(:checked)'))) {
      $('.request_accepted_fields').show();
      $('.request_refused_fields').hide();
    } else if(($('#request_asset_request_status_accepted').is(':not(:checked)')) && ($('#request_asset_request_status_refused').is(':checked'))) {
      $('.request_refused_fields').show();
      $('.request_accepted_fields').hide();
    } else if(($('#request_asset_request_status_accepted').is(':not(:checked)')) && ($('#request_asset_request_status_refused').is(':not(:checked)'))) {
      $('.request_refused_fields').hide();
      $('.request_accepted_fields').hide();
    }
  });

});


// For request assets after accept -> we will rent for you
$(function() {

  if(($('#request_asset_accept_status_rent_by_us').is(':checked') == true) || ($('#request_asset_accept_status_we_have').is(':checked') == true)) {
    $('.after_accepted_fields').show();
  } else if(($('#request_asset_accept_status_rent_by_us').is(':checked') == false) || ($('#request_asset_accept_status_we_have').is(':checked') == false)) {
    $('.after_accepted_fields').hide();
  }

  $('input[name="request_asset[accept_status]"]').change(function() {
    if(($('#request_asset_accept_status_rent_by_us').is(':checked') == true) || ($('#request_asset_accept_status_we_have').is(':checked') == true)) {
      $('.after_accepted_fields').show();
    } else if(($('#request_asset_accept_status_rent_by_us').is(':checked') == false) || ($('#request_asset_accept_status_we_have').is(':checked') == false)) {
      $('.after_accepted_fields').hide();
    }
  });

});


// For request assets after ready
$(function() {

  if($('#request_asset_ready_done').is(':checked')) {
    $('.after_ready_fields').show();
  } else if($('#request_asset_ready_done').is(':not(:checked)')) {
    $('.after_ready_fields').hide();
  }

  $('input[name="request_asset[ready_done]"]').change(function() {
    if($('#request_asset_ready_done').is(':checked')) {
      $('.after_ready_fields').show();
    } else if($('#request_asset_ready_done').is(':not(:checked)')) {
      $('.after_ready_fields').hide();
    }
  });

});


// -----------------------

// For spare refuse
$(function() {

  if($('#breakdown_spare_spare_status_refused').is(':checked') == true) {
    $('.refused_fields').show();
  } else if($('#breakdown_spare_spare_status_refused').is(':checked') == false) {
    $('.refused_fields').hide();
  }

  $('input[name="breakdown_spare[spare_status]"]').change(function() {
    if($('#breakdown_spare_spare_status_refused').is(':checked') == true) {
      $('.refused_fields').show();
    } else if($('#breakdown_spare_spare_status_refused').is(':checked') == false) {
      $('.refused_fields').hide();
    }
  });

});


