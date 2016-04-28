$(document).ready(function () {

    //Grafico de projetos finalizados e em desenvolvimento
    $('#Pessoas_EJ').click(function () {
        $.getJSON('/pessoas_EJ', function(json) {
    
      // Radialize the colors
    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    });

    // Build the chart
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Quantidade de pessoas por EJ'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                showInLegend: true,
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    },
                    connectorColor: 'silver'
                }
            }
        },
            series: [{
                data: json
            }]
        });
      });
    });

    //grafico de membros por nucleo
    $('#MembrosKer').click(function () {
        $.getJSON('/membro_nucleo', function(json) {

             // Radialize the colors
    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    });
    
         $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Quantidade de Membros por Núcleo'
        },
        subtitle: {
            text: 'Empresa júnior de Computação'
        },
        xAxis: {
            categories: [
                'Núcleos'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Quantidade'
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: json
   
        });
      });
    });


});