function emp_checklist_report(data_url) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('.workdays_count_class').html(result.workdays_count);

        $('#checklists_count_id').html(result.checklists_count);
        var perstg1 = parseFloat((result.checklists_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_percentage_id').html(perstg1 + ' %');
        if (perstg1 > 50) { $('#checklists_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }


        $('#checklists_engine_oil_count_id').html(result.checklists_engine_oil_count);
        var perstg2 = parseFloat((result.checklists_engine_oil_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_engine_oil_percentage_id').html(perstg2  + ' %');
        if (perstg2 > 50) { $('#checklists_engine_oil_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_engine_oil_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_hydraulic_oil_count_id').html(result.checklists_hydraulic_oil_count);
        var perstg3 = parseFloat((result.checklists_hydraulic_oil_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_hydraulic_oil_percentage_id').html(perstg3 + ' %');
        if (perstg3 > 50) { $('#checklists_hydraulic_oil_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_hydraulic_oil_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_gear_oil_count_id').html(result.checklists_gear_oil_count);
        var perstg4 = parseFloat((result.checklists_gear_oil_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_gear_oil_percentage_id').html(perstg4 + ' %');
        if (perstg4 > 50) { $('#checklists_gear_oil_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_gear_oil_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_breake_oil_count_id').html(result.checklists_breake_oil_count);
        var perstg5 = parseFloat((result.checklists_breake_oil_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_breake_oil_percentage_id').html(perstg5 + ' %');
        if (perstg5 > 50) { $('#checklists_breake_oil_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_breake_oil_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_battery_water_count_id').html(result.checklists_battery_water_count);
        var perstg6 = parseFloat((result.checklists_battery_water_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_battery_water_percentage_id').html(perstg6 + ' %');
        if (perstg6 > 50) { $('#checklists_battery_water_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_battery_water_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_air_filter_count_id').html(result.checklists_air_filter_count);
        var perstg7 = parseFloat((result.checklists_air_filter_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_air_filter_percentage_id').html(perstg7 + ' %');
        if (perstg7 > 50) { $('#checklists_air_filter_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_air_filter_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_fuel_water_separator_count_id').html(result.checklists_fuel_water_separator_count);
        var perstg8 = parseFloat((result.checklists_fuel_water_separator_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_fuel_water_separator_percentage_id').html(perstg8 + ' %');
        if (perstg8 > 50) { $('#checklists_fuel_water_separator_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_fuel_water_separator_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_fuel_tank_count_id').html(result.checklists_fuel_tank_count);
        var perstg9 = parseFloat((result.checklists_fuel_tank_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_fuel_tank_percentage_id').html(perstg9 + ' %');
        if (perstg9 > 50) { $('#checklists_fuel_tank_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_fuel_tank_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_radiator_coolant_hoses_count_id').html(result.checklists_radiator_coolant_hoses_count);
        var perstg10 = parseFloat((result.checklists_radiator_coolant_hoses_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_radiator_coolant_hoses_percentage_id').html(perstg10 + ' %');
        if (perstg10 > 50) { $('#checklists_radiator_coolant_hoses_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_radiator_coolant_hoses_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_lights_gauges_count_id').html(result.checklists_lights_gauges_count);
        var perstg11 = parseFloat((result.checklists_lights_gauges_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_lights_gauges_percentage_id').html(perstg11 + ' %');
        if (perstg11 > 50) { $('#checklists_lights_gauges_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_lights_gauges_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_joints_pto_shaft_count_id').html(result.checklists_joints_pto_shaft_count);
        var perstg12 = parseFloat((result.checklists_joints_pto_shaft_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_joints_pto_shaft_percentage_id').html(perstg12 + ' %');
        if (perstg12 > 50) { $('#checklists_joints_pto_shaft_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_joints_pto_shaft_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_chain_tension_count_id').html(result.checklists_chain_tension_count);
        var perstg13 = parseFloat((result.checklists_chain_tension_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_chain_tension_percentage_id').html(perstg13 + ' %');
        if (perstg13 > 50) { $('#checklists_chain_tension_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_chain_tension_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_tire_pressure_count_id').html(result.checklists_tire_pressure_count);
        var perstg14 = parseFloat((result.checklists_tire_pressure_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_tire_pressure_percentage_id').html(perstg14 + ' %');
        if (perstg14 > 50) { $('#checklists_tire_pressure_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_tire_pressure_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_tire_bolt_count_id').html(result.checklists_tire_bolt_count);
        var perstg15 = parseFloat((result.checklists_tire_bolt_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_tire_bolt_percentage_id').html(perstg15 + ' %');
        if (perstg15 > 50) { $('#checklists_tire_bolt_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_tire_bolt_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_fan_belt_tension_count_id').html(result.checklists_fan_belt_tension_count);
        var perstg16 = parseFloat((result.checklists_fan_belt_tension_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_fan_belt_tension_percentage_id').html(perstg16 + ' %');
        if (perstg16 > 50) { $('#checklists_fan_belt_tension_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_fan_belt_tension_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }

        $('#checklists_air_tank_count_id').html(result.checklists_air_tank_count);
        var perstg17 = parseFloat((result.checklists_air_tank_count / result.workdays_count) * 100).toFixed(2);
        $('#checklists_air_tank_percentage_id').html(perstg17 + ' %');
        if (perstg17 > 50) { $('#checklists_air_tank_percentage_id').removeClass('m--font-danger').addClass( "m--font-success" ); } else { $('#checklists_air_tank_percentage_id').removeClass('m--font-success').addClass( "m--font-danger" ); }


        $('#checklists_hours_sum_id').html(result.checklists_hours_sum);
        $('#checklists_hours_average_id').html(parseFloat(result.checklists_hours_average).toFixed(2));


        $('#checklists_meters_different_id').html(result.checklists_meters_emp_end_date - result.checklists_meters_emp_start_date);
        $('#checklists_meters_average_id').html(parseFloat((result.checklists_meters_emp_end_date - result.checklists_meters_emp_start_date) / result.checklists_meters_count).toFixed(2));



      }
    });
}