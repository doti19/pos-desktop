import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyBar extends StatefulWidget {
  const MonthlyBar({super.key});

  @override
  State<MonthlyBar> createState() => _MonthlyBarState();
}

class _MonthlyBarState extends State<MonthlyBar> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Monthly Sales - 2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Row(
                children: <Widget>[
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.refresh),
                    color: Colors.white,
                    iconSize: 25,
                  ),
                  const Switch(value: false, onChanged: null),
                  Row(
                    children: const <Widget>[
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_left),
                        color: Colors.white,
                        iconSize: 25,
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_right),
                        color: Colors.white,
                        iconSize: 25,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const Text(
            "Sales data grouped by month",
            style: TextStyle(color: Colors.white54),
          ),
          const Expanded(child: _BarChart()),
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();
  static const Color contentColorCyan = Color(0xFF50E4FF);
  static const Color contentColorBlue = Color.fromARGB(255, 0, 100, 182);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        groupsSpace: 10.0,
        alignment: BarChartAlignment.spaceAround,

        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        // alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: contentColorCyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: contentColorBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sep';
        break;
      case 1:
        text = 'Oct';
        break;
      case 2:
        text = 'Nov';
        break;
      case 3:
        text = 'Dec';
        break;
      case 4:
        text = 'Jan';
        break;
      case 5:
        text = 'Feb';
        break;
      case 6:
        text = 'Mar';
        break;
      case 7:
        text = 'Apr';
        break;
      case 8:
        text = 'May';
        break;
      case 9:
        text = 'Jun';
        break;
      case 10:
        text = 'Jul';
        break;
      case 11:
        text = 'Aug';
        break;

      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          contentColorBlue,
          contentColorCyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 16,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              toY: 11,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              toY: 9,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: 3,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              toY: 5,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              toY: 12,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
