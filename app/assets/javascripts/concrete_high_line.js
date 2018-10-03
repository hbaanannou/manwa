function concrete_high_line( element_id, data_url, query_name) {

    $.ajax({
        url: data_url,
        dataType: 'json',
        success: function(result){

            $(element_id).highcharts({
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Daily Concrete Amounts Report',
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
                    name: '200 - Normal',
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
                    name: '200 - Resistant',
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
                    name: '250 - Normal',
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
                    name: '250 - Resistant',
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
                    name: '280 - Normal',
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
                    name: '280 - Resistant',
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
                    name: '300 - Normal',
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
                    name: '300 - Resistant',
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
                    name: '350 - Normal',
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
                    name: '350 - Resistant',
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
                    name: '375 - Normal',
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
                    name: '375 - Resistant',
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
                    name: '400 - Normal',
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
                    name: '400 - Resistant',
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
                    name: '420 - Normal',
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
                    name: '420 - Resistant',
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
                    name: '425 - Normal',
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
                    name: '425 - Resistant',
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
                    name: '440 - Normal',
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
                    name: '440 - Resistant',
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
                    name: '450 - Normal',
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
                    name: '450 - Resistant',
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
                    name: '475 - Normal',
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
                    name: '475 - Resistant',
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
            var point7 = [];
            var point8 = [];
            var point9 = [];
            var point10 = [];
            var point11 = [];
            var point12 = [];
            var point13 = [];
            var point14 = [];
            var point15 = [];
            var point16 = [];
            var point17 = [];
            var point18 = [];
            var point19 = [];
            var point20 = [];
            var point21 = [];
            var point22 = [];
            var point23 = [];
            var point24 = [];

            if (chart) {

                $.each(result[query_name], function(key, va) {

                    if (va.pro_concrete_type_id == 1 && va.pro_concrete_product_id == 1) {
                       point1.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 1 && va.pro_concrete_product_id == 2) {
                       point2.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 2 && va.pro_concrete_product_id == 1) {
                       point3.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 2 && va.pro_concrete_product_id == 2) {
                       point4.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 3 && va.pro_concrete_product_id == 1) {
                       point5.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 3 && va.pro_concrete_product_id == 2) {
                       point6.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 4 && va.pro_concrete_product_id == 1) {
                       point7.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 4 && va.pro_concrete_product_id == 2) {
                       point8.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 5 && va.pro_concrete_product_id == 1) {
                       point9.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 5 && va.pro_concrete_product_id == 2) {
                       point10.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 6 && va.pro_concrete_product_id == 1) {
                       point11.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 6 && va.pro_concrete_product_id == 2) {
                       point12.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 7 && va.pro_concrete_product_id == 1) {
                       point13.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 7 && va.pro_concrete_product_id == 2) {
                       point14.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 8 && va.pro_concrete_product_id == 1) {
                       point15.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 8 && va.pro_concrete_product_id == 2) {
                       point16.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 9 && va.pro_concrete_product_id == 1) {
                       point17.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 9 && va.pro_concrete_product_id == 2) {
                       point18.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 10 && va.pro_concrete_product_id == 1) {
                       point19.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 10 && va.pro_concrete_product_id == 2) {
                       point20.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 11 && va.pro_concrete_product_id == 1) {
                       point21.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 11 && va.pro_concrete_product_id == 2) {
                       point22.push([Date.parse(va.day), va.amount]);
                    }

                    if (va.pro_concrete_type_id == 12 && va.pro_concrete_product_id == 1) {
                       point23.push([Date.parse(va.day), va.amount]); 
                    } 

                    if (va.pro_concrete_type_id == 12 && va.pro_concrete_product_id == 2) {
                       point24.push([Date.parse(va.day), va.amount]);
                    }

                });


                chart.series[0].setData(point1);
                chart.series[1].setData(point2);
                chart.series[2].setData(point3);
                chart.series[3].setData(point4);
                chart.series[4].setData(point5);
                chart.series[5].setData(point6);
                chart.series[6].setData(point7);
                chart.series[7].setData(point8);
                chart.series[8].setData(point9);
                chart.series[9].setData(point10);
                chart.series[10].setData(point11);
                chart.series[11].setData(point12);
                chart.series[12].setData(point13);
                chart.series[13].setData(point14);
                chart.series[14].setData(point15);
                chart.series[15].setData(point16);
                chart.series[16].setData(point17);
                chart.series[17].setData(point18);
                chart.series[18].setData(point19);
                chart.series[19].setData(point20);
                chart.series[20].setData(point21);
                chart.series[21].setData(point22);
                chart.series[22].setData(point23);
                chart.series[23].setData(point24);

            }

        }
    });

}