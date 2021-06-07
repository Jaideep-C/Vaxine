import 'package:flutter/material.dart';
import 'package:mod/data/centers.dart';

class SessionListPage extends StatelessWidget {
  const SessionListPage({Key key, this.vaccineCenter}) : super(key: key);
  final VaccineCenter vaccineCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Center"),
      ),
      body: SingleChildScrollView(
        // physics: SimpleScrollPhysics(),
        child: Column(
          children: [
            _dataTable(vaccineCenter),
            Divider(),
            Center(
              child: Text(
                "Sessions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListView.builder(
              // scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: vaccineCenter.sessions.length,
              itemBuilder: _sessionListBuilder,
            )
          ],
        ),
      ),
    );
  }

  DataTable _dataTable(VaccineCenter vaccineCenter) {
    var _addressRow = DataRow(cells: <DataCell>[
      DataCell(Text("Address")),
      DataCell(Text(vaccineCenter.address))
    ]);

    var _blockRow = DataRow(cells: <DataCell>[
      DataCell(Text("Block")),
      DataCell(Text(vaccineCenter.blockName))
    ]);

    var _districtRow = DataRow(cells: <DataCell>[
      DataCell(Text("District")),
      DataCell(Text(vaccineCenter.districtName))
    ]);

    var _stateRow = DataRow(cells: <DataCell>[
      DataCell(Text("State")),
      DataCell(Text(vaccineCenter.stateName))
    ]);

    var _feesRow = DataRow(cells: <DataCell>[
      DataCell(Text("Fee type")),
      DataCell(Text(vaccineCenter.feeType))
    ]);
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            "Name",
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataColumn(
          label: Text(
            vaccineCenter.name,
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      rows: <DataRow>[
        _addressRow,
        _blockRow,
        _districtRow,
        _stateRow,
        _feesRow,
      ],
    );
  }

  Widget _sessionListBuilder(BuildContext ctx, int index) {
    final session = vaccineCenter.sessions[index];
    List<Widget> slots = session.slots
        .map((slot) =>
            ListTile(title: Text(slot, style: TextStyle(fontSize: 18))))
        .toList();
    slots.insert(
        0,
        ListTile(
            title:
                Text("Slot", style: TextStyle(fontWeight: FontWeight.bold))));
    return Column(
      children: [
        ExpansionTile(
          title: Text('${session.vaccine}'),
          subtitle: Text(session.date),
          trailing: Column(
            children: [
              Text("Min age ${session.minAgeLimit}\n"),
              Text(
                "Capacity ${session.availableCapacity}",
                style: TextStyle(
                  color: session.availableCapacity != 0
                      ? Colors.greenAccent
                      : Colors.redAccent,
                ),
              ),
            ],
          ),
          children: slots,
        ),
        // Divider(color: Colors.grey)
      ],
    );
  }
}
