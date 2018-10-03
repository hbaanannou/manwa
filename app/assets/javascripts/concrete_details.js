function concrete_details(data_url) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#concrete_hours_sum_id').html(result.province_hours_sum);
        $('#concrete_amount_sum_id').html(result.province_amount_sum);

        $('#concrete_200_normal_id').html(result.province_200_normal_amount_sum);
        if (result.province_200_normal_amount_sum > 0) { $('#concrete_200_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_200_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_200_resistant_id').html(result.province_200_resistant_amount_sum);
        if (result.province_200_resistant_amount_sum > 0) { $('#concrete_200_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_200_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_250_normal_id').html(result.province_250_normal_amount_sum);
        if (result.province_250_normal_amount_sum > 0) { $('#concrete_250_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_250_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_250_resistant_id').html(result.province_250_resistant_amount_sum);
        if (result.province_250_resistant_amount_sum > 0) { $('#concrete_250_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_250_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_280_normal_id').html(result.province_280_normal_amount_sum);
        if (result.province_280_normal_amount_sum > 0) { $('#concrete_280_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_280_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_280_resistant_id').html(result.province_280_resistant_amount_sum);
        if (result.province_280_resistant_amount_sum > 0) { $('#concrete_280_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_280_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_300_normal_id').html(result.province_300_normal_amount_sum);
        if (result.province_300_normal_amount_sum > 0) { $('#concrete_300_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_300_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_300_resistant_id').html(result.province_300_resistant_amount_sum);
        if (result.province_300_resistant_amount_sum > 0) { $('#concrete_300_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_300_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_350_normal_id').html(result.province_350_normal_amount_sum);
        if (result.province_350_normal_amount_sum > 0) { $('#concrete_350_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_350_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_350_resistant_id').html(result.province_350_resistant_amount_sum);
        if (result.province_350_resistant_amount_sum > 0) { $('#concrete_350_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_350_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_375_normal_id').html(result.province_375_normal_amount_sum);
        if (result.province_375_normal_amount_sum > 0) { $('#concrete_375_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_375_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_375_resistant_id').html(result.province_375_resistant_amount_sum);
        if (result.province_375_resistant_amount_sum > 0) { $('#concrete_375_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_375_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_400_normal_id').html(result.province_400_normal_amount_sum);
        if (result.province_400_normal_amount_sum > 0) { $('#concrete_400_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_400_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_400_resistant_id').html(result.province_400_resistant_amount_sum);
        if (result.province_400_resistant_amount_sum > 0) { $('#concrete_400_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_400_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_420_normal_id').html(result.province_420_normal_amount_sum);
        if (result.province_420_normal_amount_sum > 0) { $('#concrete_420_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_420_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_420_resistant_id').html(result.province_420_resistant_amount_sum);
        if (result.province_420_resistant_amount_sum > 0) { $('#concrete_420_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_420_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_425_normal_id').html(result.province_425_normal_amount_sum);
        if (result.province_425_normal_amount_sum > 0) { $('#concrete_425_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_425_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_425_resistant_id').html(result.province_425_resistant_amount_sum);
        if (result.province_425_resistant_amount_sum > 0) { $('#concrete_425_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_425_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_440_normal_id').html(result.province_440_normal_amount_sum);
        if (result.province_440_normal_amount_sum > 0) { $('#concrete_440_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_440_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_440_resistant_id').html(result.province_440_resistant_amount_sum);
        if (result.province_440_resistant_amount_sum > 0) { $('#concrete_440_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_440_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_450_normal_id').html(result.province_450_normal_amount_sum);
        if (result.province_450_normal_amount_sum > 0) { $('#concrete_450_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_450_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_450_resistant_id').html(result.province_450_resistant_amount_sum);
        if (result.province_450_resistant_amount_sum > 0) { $('#concrete_450_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_450_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#concrete_475_normal_id').html(result.province_475_normal_amount_sum);
        if (result.province_475_normal_amount_sum > 0) { $('#concrete_475_normal_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_475_normal_id').removeClass('m--font-success').addClass( "m--font-danger" ); }
        $('#concrete_475_resistant_id').html(result.province_475_resistant_amount_sum);
        if (result.province_475_resistant_amount_sum > 0) { $('#concrete_475_resistant_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#concrete_475_resistant_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

      }
    });
}