function crusher_details(data_url) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#crusher_hours_sum_id').html(result.province_hours_sum);
        $('#crusher_amount_sum_id').html(result.province_amount_sum);

        $('#crusher_3_8_in_id').html(result.province_3_8_in_amount_sum);
        $('#crusher_3_4_in_id').html(result.province_3_4_in_amount_sum);

        $('#crusher_1_in_id').html(result.province_1_in_amount_sum);
        $('#crusher_11_2_in_id').html(result.province_11_2_in_amount_sum);

        $('#crusher_oversize_id').html(result.province_oversize_amount_sum);
        $('#crusher_aggregate_id').html(result.province_aggregate_amount_sum);

      }
    });
}