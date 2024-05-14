import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VoteChart extends StatelessWidget {
  final List<LinearVote> data;
  final bool animate;

  VoteChart(this.data, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Defina uma altura específica
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: true,
            leftTitles: AxisTitles(
              axisNameWidget: const Text('Votos'),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
              )
            ),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta){
                      String text = "";
                      switch (value.toInt()) {
                        case 5:
                          text = "maio";
                          break;
                        case 6:
                          text = "junho";
                          break;
                        case 7:
                          text = "julho";
                          break;
                        case 8:
                          text = "agosto";
                          break;
                        case 9:
                          text = "setembro";
                          break;
                        case 10:
                          text = "outubro";
                          break;
                      }
                      return Text(text);
                    }
                  )
              )
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: _convertData(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _convertData() {
    return data.map((vote) => FlSpot(vote.month.toDouble(), vote.votes.toDouble())).toList();
  }
}


class LinearVote {
  final int month;
  final int votes;

  LinearVote(this.month, this.votes);
}
