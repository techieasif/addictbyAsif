
import '../../src/Widgets/customToast.dart';
import '../../src/Screens/targetSettingScreen.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  final targetDurationName;
  final Map<String, String> data;

  const ProgressScreen({Key key, this.data, this.targetDurationName}) : super(key: key);
  @override
  _ProgressScreenState createState() => _ProgressScreenState(data);
}

class _ProgressScreenState extends State<ProgressScreen> {
  final Map<String, dynamic> dataReceived;
  _ProgressScreenState(this.dataReceived);
  Size screenSize;

  //Target variable
  int aTarget;
  int dTarget;
  int d2Target;
  int iTarget;
  int cTarget;
  int tTarget;

  //currentVariable
  int currentA = 0;
  int currentD = 0;
  int currentD2 = 0;
  int currentI = 0;
  int currentC = 0;
  int currentT = 0;

  bool reset = false;
  @override
  void initState() {
    super.initState();
    aTarget = int.parse(dataReceived['a']);
    dTarget = int.parse(dataReceived['d']);
    d2Target = int.parse(dataReceived['d2']);
    iTarget = int.parse(dataReceived['i']);
    cTarget = int.parse(dataReceived['c']);
    tTarget = int.parse(dataReceived['t']);
  }


  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("${widget.targetDurationName} Progress"),
        actions: <Widget>[
          IconButton(
            onPressed: resetTarget,
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TargetSettingPage()));
              showToast(context, "Set new Target");
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[buildA(context), buildD(context)],
            ),
            Row(
              children: <Widget>[buildD2(context), buildI(context)],
            ),
            Row(
              children: <Widget>[buildC(context), buildT(context)],
            ),
          ],
        ),
      ),
    );
  }

  void resetTarget() {
    setState(() {
      currentA = 0;
      currentD = 0;
      currentD2 = 0;
      currentI = 0;
      currentC = 0;
      currentT = 0;
    });

    showToast(context, "Target reset", bgColor: Colors.green);
  }

  Expanded buildT(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: screenSize.height / 3.5,
        width: screenSize.width / 2,
        child: Card(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (currentT != tTarget)
                  setState(() => currentT++);
                else
                  showToast(context, "You are exceeding your limit for T",
                      bgColor: Colors.redAccent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "T",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("C: $currentT", style: Theme.of(context).textTheme.subtitle1,),
                        Text("T: $tTarget", style: Theme.of(context).textTheme.subtitle1,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildC(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey.shade50,
        height: screenSize.height / 3.5,
        width: screenSize.width / 2,
        child: Card(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (currentC != cTarget)
                  setState(() => currentC++);
                else
                  showToast(context, "You are exceeding your limit for C",
                      bgColor: Colors.redAccent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "C",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("C: $currentC",style: Theme.of(context).textTheme.subtitle1),
                        Text("T: $cTarget",style: Theme.of(context).textTheme.subtitle1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildI(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey.shade50,
        height: screenSize.height / 3.5,
        width: screenSize.width / 2,
        child: Card(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (currentI != iTarget)
                  setState(() => currentI++);
                else
                  showToast(context, "You are exceeding your limit for I",
                      bgColor: Colors.redAccent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "I",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("C: $currentI",style: Theme.of(context).textTheme.subtitle1),
                        Text("T: $iTarget",style: Theme.of(context).textTheme.subtitle1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildD2(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey.shade50,
        height: screenSize.height / 3.5,
        width: screenSize.width / 2,
        child: Card(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (currentD2 != d2Target)
                  setState(() => currentD2++);
                else
                  showToast(context, "You are exceeding your limit for D",
                      bgColor: Colors.redAccent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "D",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("C: $currentD2",style: Theme.of(context).textTheme.subtitle1),
                        Text("T: $d2Target",style: Theme.of(context).textTheme.subtitle1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildD(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey.shade50,
        height: screenSize.height / 3.5,
        width: screenSize.width / 2,
        child: Card(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (currentD != dTarget)
                  setState(() => currentD++);
                else
                  showToast(context, "You are exceeding your limit for D",
                      bgColor: Colors.redAccent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "D",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("C: $currentD",style: Theme.of(context).textTheme.subtitle1),
                        Text("T: $dTarget",style: Theme.of(context).textTheme.subtitle1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildA(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey.shade50,
        height: screenSize.height / 3.5,
        width: screenSize.width / 2,
        child: Card(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (currentA != aTarget)
                  setState(() => currentA++);
                else
                  showToast(context, "You are exceeding your limit for A",
                      bgColor: Colors.redAccent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "A",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("C: $currentA",style: Theme.of(context).textTheme.subtitle1),
                        Text("T: $aTarget",style: Theme.of(context).textTheme.subtitle1)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

