import '../../src/Screens/progressScreen.dart';
import 'package:flutter/material.dart';

class TargetSettingPage extends StatefulWidget {
  @override
  _TargetSettingPageState createState() => _TargetSettingPageState();
}

class _TargetSettingPageState extends State<TargetSettingPage> {
  String selectedTargetDuration;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController aController = TextEditingController();
  TextEditingController dController = TextEditingController();
  TextEditingController d2Controller = TextEditingController();
  TextEditingController iController = TextEditingController();
  TextEditingController cController = TextEditingController();
  TextEditingController tController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    aController.dispose();
    dController.dispose();
    d2Controller.dispose();
    iController.dispose();
    cController.dispose();
    tController.dispose();
  }

  Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: saveData, label: Text("Save")),
      appBar: AppBar(
        title: Text('Target Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildDropDown(),
            targetForm(),
          ],
        ),
      ),
    );
  }

  Widget targetForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildAddictItem('A', aController),
            buildAddictItem('D', dController),
            buildAddictItem('D', d2Controller),
            buildAddictItem('I', iController),
            buildAddictItem('C', cController),
            buildAddictItem('T', tController),
          ],
        ),
      ),
    );
  }


  void saveData() {
    Map<String, String> targetData = {
      "a": aController.text.isEmpty ? "0" : aController.text,
      "d": dController.text.isEmpty ? "0" : dController.text,
      "d2": d2Controller.text.isEmpty ? "0" : d2Controller.text,
      "i": iController.text.isEmpty ? "0" : iController.text,
      "c": cController.text.isEmpty ? "0" : cController.text,
      "t": tController.text.isEmpty ? "0" : tController.text
    };
    clearControllerValues();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ProgressScreen(
              targetDurationName: selectedTargetDuration,
              data: targetData,
            )));
  }

  Row buildAddictItem(String title, TextEditingController controller) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            )),
        Expanded(
          flex: 1,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0',
            ),
          ),
        ),
      ],
    );
  }

  //Target Duration Widget
  Widget buildDropDown() {
    List<String> targetDuration = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
//    selectedTargetDuration = targetDuration.first;
    return Container(
        height: 45,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff707070).withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
          hint: Text(
            targetDuration.first,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          underline: Container(),
          value: selectedTargetDuration,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          isExpanded: true,
          onChanged: (String newValue) {
            setState(() {
              selectedTargetDuration = newValue;
            });
          },
          items: targetDuration.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
        ));
  }

  void clearControllerValues() {
    aController.clear();
    dController.clear();
    d2Controller.clear();
    iController.clear();
    cController.clear();
    tController.clear();
  }
}
