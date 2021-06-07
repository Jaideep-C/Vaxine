import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mod/data/centers.dart';
import 'package:mod/pages/sessionListPage.dart';

class VaccineCentersPage extends StatelessWidget {
  const VaccineCentersPage({Key key, this.vaccineCenters}) : super(key: key);
  final List<VaccineCenter> vaccineCenters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Centers List")),
      body: ListView.builder(
          itemCount: vaccineCenters.length, itemBuilder: _centerItemBuilder),
    );
  }

  Widget _centerItemBuilder(BuildContext ctx, int index) {
    VaccineCenter vaccineCenter = vaccineCenters[index];
    print(vaccineCenter.feeType);
    return InkWell(
      onTap: () {
        _onCentreTileTap(ctx, vaccineCenter);
      },
      child: Column(
        children: [
          ListTile(
            title: Text(
              vaccineCenter.name,
              style: TextStyle(
                  color: vaccineCenter.feeType == "Free"
                      ? Colors.green
                      : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(vaccineCenter.address),
            trailing: Text(vaccineCenter.blockName),
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }

  void _onCentreTileTap(BuildContext ctx, VaccineCenter vaccineCenter) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
          builder: (ctx) => SessionListPage(vaccineCenter: vaccineCenter)),
    );
  }
}
