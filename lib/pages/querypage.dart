import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mod/data/centers.dart';
import 'package:mod/pages/errorPage.dart';
import 'package:mod/pages/vaccineCentersPage.dart';
import 'package:mod/pages/widgets/btn.dart';
import 'package:mod/utils/api.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({Key key}) : super(key: key);

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  final pincodeController = TextEditingController();
  bool isValid = true;

  @override
  void initState() {
    super.initState();
    pincodeController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildPinCode(),
        const SizedBox(height: 20),
        Center(child: buildErrTxt()),
        btnGet(),
      ],
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
    );
  }

  Widget buildPinCode() => TextField(
        controller: pincodeController,
        decoration: InputDecoration(
          hintText: 'Enter your Pincode',
          labelText: 'PinCode',
          suffixIcon: pincodeController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => pincodeController.clear(),
                )
              : Container(
                  width: 0,
                ),
        ),
        keyboardType: TextInputType.number,
      );

  Widget buildErrTxt() {
    return Visibility(
      visible: !isValid,
      child: Text(
        "Invalid pincode",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget btnGet() => ButtonWidget(
        text: "Submit",
        onClicked: () {
          setState(() {
            isValid = pincodeController.text.isNotEmpty &&
                pincodeController.text.length == 6 &&
                isNumeric(pincodeController.text);
            onClick(context);
          });
        },
      );

  Future<void> onClick(BuildContext ctx) async {
    if (!isValid) return;
    String today = DateFormat('d-M-y').format(DateTime.now()),
        pincode = pincodeController.text;
    try {
      final List<VaccineCenter> vaccineCenters =
          await Api.fetchCentersList(pincode, today);
      Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (ctx) =>
                VaccineCentersPage(vaccineCenters: vaccineCenters)),
      );
    } catch (e) {
      Navigator.push(
        ctx,
        MaterialPageRoute(builder: (ctx) => ErrorPage(text: e.toString())),
      );
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s) != null;
  }
}
