import 'package:flutter/material.dart';
import 'package:flutter_charts_examples/chart_example/models.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class ChartsScreen extends StatefulWidget {
  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(year: '09', earning: 18.5),
      EarningsTimeline(year: '09', earning: 21),
      EarningsTimeline(year: '10', earning: 30),
      EarningsTimeline(year: '11', earning: 38),
      EarningsTimeline(year: '12', earning: 42),
      EarningsTimeline(year: '13', earning: 43.5),
      EarningsTimeline(year: '14', earning: 73),
      EarningsTimeline(year: '15', earning: 79.6),
      EarningsTimeline(year: '16', earning: 82),
      EarningsTimeline(year: '17', earning: 93),
      EarningsTimeline(year: '18', earning: 108),
      EarningsTimeline(year: '19', earning: 109),
      EarningsTimeline(year: '20', earning: 117),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [

      charts.Series(
        id: 'Subscribers',
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.year,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Flutter Charts Sample')),
      body: Center(
          child: Container(
        height: 400,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Cristiano Ronaldo Earnings (\$M)',
                ),
                Expanded(
                  child: charts.BarChart(timeline, animate: true),
                ),
                Text(
                  'Source: Forbes',
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
