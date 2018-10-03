function asphalt_details(data_url) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#asphalt_hours_sum_id').html(result.province_hours_sum);
        $('#asphalt_amount_sum_id').html(result.province_amount_sum);

        $('#asphalt_base_70_10_id').html(result.province_base_70_10_amount_sum);
        $('#asphalt_base_76_10_id').html(result.province_base_76_10_amount_sum);

        $('#asphalt_base_60_70_id').html(result.province_base_60_70_amount_sum);
        $('#asphalt_wearing_70_10_id').html(result.province_wearing_70_10_amount_sum);

        $('#asphalt_wearing_76_10_id').html(result.province_wearing_76_10_amount_sum);
        $('#asphalt_wearing_60_70_id').html(result.province_wearing_60_70_amount_sum);

      }
    });
}