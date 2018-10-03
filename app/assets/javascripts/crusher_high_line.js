function crusher_high_line( element_id, data_url, query_name) {

    $.ajax({
        url: data_url,
        dataType: 'json',
        success: function(result){

            $(element_id).highcharts({
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Daily Crusher Amounts Report',
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
                plotOptions: {
                    spline: {
                        marker: {
                            enabled: true
                        }
                    }
                },
                series: [{
                    name: '3/8 IN',
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
                }, {
                    name: '3/4 IN',
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
                }, {
                    name: '1 IN',
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
                }, {
                    name: '11/2 IN',
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
                }, {
                    name: 'Oversize',
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
                }, {
                    name: 'Aggregate',
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
            var point1 = [];
            var point2 = [];
            var point3 = [];
            var point4 = [];
            var point5 = [];
            var point6 = [];

            if (chart) {

                $.each(result[query_name], function(key, va) {

                    if (va.pro_crusher_type_id == 1) {
                       point1.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_crusher_type_id == 2) {
                       point2.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_crusher_type_id == 3) {
                       point3.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_crusher_type_id == 4) {
                       point4.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_crusher_type_id == 5) {
                       point5.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_crusher_type_id == 6) {
                       point6.push([Date.parse(va.day), va.amount]);
                    }


                });


                chart.series[0].setData(point1);
                chart.series[1].setData(point2);
                chart.series[2].setData(point3);
                chart.series[3].setData(point4);
                chart.series[4].setData(point5);
                chart.series[5].setData(point6);

            }

        }
    });

}