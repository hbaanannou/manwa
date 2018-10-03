function asphalt_high_line_one( element_id, data_url, query_name) {

    $.ajax({
        url: data_url,
        dataType: 'json',
        success: function(result){

            $(element_id).highcharts({
                title: {
                    text: 'Daily Asphalt Amounts Report',
                    x: -20 //center
                },
                subtitle: {
                    text: '',
                    x: -20
                },
                xAxis: {
                    type: 'datetime',
                    labels: {
                        style: {fontSize: '1.0em'},
                        format: '{value:%Y-%m-%d}'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Meter',
                        style: {
                            //color: Highcharts.getOptions().colors[2]
                        }
                    },
                    labels: {
                        format: '{value} ',
                        style: {
                            //color: Highcharts.getOptions().colors[2]
                        }
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '',
                    xDateFormat: '%Y-%m-%d'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Asphalt',
                    data: [],
                    dataLabels: {
                        enabled: true,
                        formatter: function() {

                            var y_value = this.y;
                            var y_color;
                            if (y_value < 50) { y_color = 'Crimson'}
                            else if (y_value > 50 && y_value < 85) { y_color = '#f0ad4e'}
                            else if (y_value > 85) { y_color = 'SEAGREEN'}

                            return '<span style="font-size: 1.1em; text-shadow: 1px 1px #EEE; color:' + y_color + '">' + this.y + ' </span>';

                        }
                    }
                }],
                credits: {
                    enabled: false // for remove highcharts link
                }
            });


            var chart = $(element_id).highcharts();
            var categories = [];
            var point1 = [];

            if (chart) {

                $.each(result[query_name], function(key, va) {

                    categories.push(Date.parse(va.day));
                    point1.push(va.amount); 

                });

                chart.xAxis[0].setCategories(categories);
                chart.series[0].setData(point1);


            }

        }
    });

}