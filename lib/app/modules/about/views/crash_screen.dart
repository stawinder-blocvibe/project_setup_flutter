
import '../../../export.dart';

class CrashReportScreen extends StatefulWidget {
  const CrashReportScreen({super.key});

  @override
  State<CrashReportScreen> createState() => _CrashReportScreenState();
}

class _CrashReportScreenState extends State<CrashReportScreen> {
  Map<String, dynamic> crashData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        bgColor: Colors.black,
        appBarTitleText: "Crash Report",
      ),
      body: crashData.isNotEmpty
          ? Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: margin_10, vertical: margin_15),
                  child: Row(
                    children: [
                      SizedBox(width: width_100, child: Text("Crash On")),
                      Text(":"),
                      SizedBox(
                        width: width_10,
                      ),
                      Expanded(child: Text(crashData["LogTime"]))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: margin_10, vertical: margin_15),
                  child: Row(
                    children: [
                      SizedBox(width: width_100, child: Text("Device Version")),
                      Text(":"),
                      SizedBox(
                        width: width_10,
                      ),
                      Expanded(child: Text(crashData["Log[link]"]))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: margin_10, vertical: margin_15),
                  child: Row(
                    children: [
                      SizedBox(width: width_100, child: Text("Device Name")),
                      Text(":"),
                      SizedBox(
                        width: width_10,
                      ),
                      Expanded(child: Text(crashData["Log[referer_link]"]))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: margin_10, vertical: margin_15),
                  child: Row(
                    children: [
                      SizedBox(width: width_100, child: Text("Device ID")),
                      Text(":"),
                      SizedBox(
                        width: width_10,
                      ),
                      Expanded(child: Text(crashData["Log[user_ip]"]))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: margin_10, vertical: margin_15),
                  child: Row(
                    children: [
                      SizedBox(width: width_100, child: Text("Error")),
                      Text(":"),
                      SizedBox(
                        width: width_10,
                      ),
                      Expanded(child: Text(crashData["Log[stackTrace]"]))
                    ],
                  ),
                ),
              ],
            )
          : Center(child: Text("No Crash Record yet!")),
    );
  }

  void readData() {
    //   (flutterLogger.readFile()).then((value) {
    //     setState(() {
    //       crashData = value;
    //     });
    //   });
    // }
  }
}
