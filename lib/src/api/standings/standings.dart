import 'package:apex/src/models/standings/driver_standings.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;

class StandingsAPI {
  Future<(String? error, List<DriverStanding> driverStandings)>
  getDriverStandings({
    required int year,
  }) async {
    final driverStandings = <DriverStanding>[];
    final response = await http.get(
      Uri.parse('https://www.formula1.com/en/results/$year/drivers'),
    );
    if (response.statusCode != 200) {
      return ('', driverStandings);
    }

    try {
      final document = html.parse(response.body);
      final tableBody = document.querySelector('table>tbody');
      final rows = tableBody?.querySelectorAll('tr');
      for (var row in rows ?? []) {
        final List<dom.Element> cells = row.querySelectorAll('td');
        final String position = cells.first.innerHtml;

        final driverNameElement = cells[1].children.last.children.last.children;
        final String driverFirstName = driverNameElement.first.text;
        final String driverLastName = driverNameElement[1].text;

        final teamNameElement = cells[3].firstChild;
        final teamName = teamNameElement?.text ?? '';
        final teamColorString =
            teamNameElement?.firstChild?.attributes['style']
                ?.split(';')
                .firstWhere(
                  (element) => element.startsWith('background-color:'),
                )
                .split(':')
                .last
                .trim();

        final String points = cells.last.innerHtml;
        driverStandings.add(
          DriverStanding(
            position: int.parse(position),
            driverFirstName: driverFirstName,
            driverLastName: driverLastName,
            teamName: teamName,
            teamColorString: teamColorString,
            points: int.parse(points),
          ),
        );
      }
    } catch (e) {
      return ('Error: $e', driverStandings);
    }
    return (null, driverStandings);
  }
}
