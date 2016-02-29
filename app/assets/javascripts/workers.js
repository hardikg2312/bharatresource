var ready = function(){
  var val = $('#worker_state_id').val();
  filter_regions(val);
  $('#worker_state_id').on('change', function () {
    var val = this.value;
    filter_regions(val);
  });

  var val = $('#worker_industry_id').val();
  filter_sub_industry(val);
  $('#worker_industry_id').on('change', function () {
    var val = this.value;
    filter_sub_industry(val);
  });

  function filter_regions(val){
    $('#worker_region_id option').hide();
    $('#worker_region_id option[state-id='+val+']').show();
    var new_val = $('#worker_region_id option[state-id='+val+']')[0].value;
    $('#worker_region_id').val(new_val);
  }

  function filter_sub_industry(val){
    $('#worker_sub_industry_id option').hide();
    $('#worker_sub_industry_id option[industry-id='+val+']').show();
    var new_val = $('#worker_sub_industry_id option[industry-id='+val+']')[0].value;
    $('#worker_sub_industry_id').val(new_val);
  }

}

// Terbolinks Causing problem
// javascript not work from link_to
// So adding this line of code
$(document).ready(ready);
$(document).on('page:load', ready);