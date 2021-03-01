import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';

void main() => runApp(TrashApp());

class TrashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/SplashScreen_1.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 500),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.0,
                  // leading: new Text("left content"),
                  // trailing: new Text("right content"),
                  percent: 0.2,
                  // center: Text("20.0%"),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: HexColor("#00EDFF"),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text("Reading Trash...",
                            style: TextStyle(
                              fontFamily: "SergoeUI",
                              color: HexColor("#B8B8B8"),
                            )),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          color: HexColor("#707070"),
                          margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 4.0),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                              child: Text("Start",
                                  style: TextStyle(
                                      color: HexColor("#FFFFFF"),
                                      fontFamily: "SergoeUI")))),
                    ))
              ],
            )));
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void scrollCallBack(DragUpdateDetails dragUpdate) {
    ScrollController _controller;

    @override
    void initState() {
      //Initialize the  scrollController
      _controller = ScrollController();
      super.initState();
    }

    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  bool fileDetails = false;
  bool fDetails = false;

  void fileTap() {
    setState(() {
      fDetails = false;
      fileDetails = true;
    });
  }

  void folderTap() {
    setState(() {
      fileDetails = false;
      fDetails = true;
      print(fDetails);
    });
  }

  void closeFileTap() {
    setState(() {
      fileDetails = false;
    });
  }

  void closeFolderTap() {
    setState(() {
      fDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width25 = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/sideLogo.jpg",
                                height: 70, fit: BoxFit.fill),
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   // margin: EdgeInsets.all(10),
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image: AssetImage("assets/images/sideLogo.jpg"))),
                            //   // child: SizedBox(height: 100)
                            // )
                            SizedBox(width: 30),
                            Text("Wednesday 10:22",
                                style: TextStyle(
                                    fontFamily: "SergoeUI_bold",
                                    color: HexColor("#565656"),
                                    fontSize: 22))
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: HexColor("#00D5DC"),
                              margin:
                                  EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset("assets/images/refresh.jpg",
                                    height: 25, fit: BoxFit.fill),
                              ),
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: HexColor("#00D5DC"),
                                margin:
                                    EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text("LIGHT MODE"),
                                )),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: HexColor("##F1F1F1"),
                                margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 30, 0, 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          "HOST-PC NAME                ",
                                          style: TextStyle(
                                              fontFamily: "SergoeUI",
                                              color: HexColor("#808080")),
                                        ),
                                      ],
                                    ))),
                          ],
                        )
                      ],
                    ),
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 10.0,
                    // leading: new Text("left content"),
                    // trailing: new Text("right content"),
                    percent: 0.2,
                    // center: Text("20.0%"),
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: HexColor("#00EDFF"),
                  ),
                  Container(
                      color: Colors.white,
                      child: Padding(
                          padding: fileDetails
                              ? EdgeInsets.fromLTRB(20, 20, 0, 20)
                              : fDetails
                                  ? EdgeInsets.fromLTRB(20, 20, 0, 20)
                                  : EdgeInsets.all(20),
                          child: Expanded(
                            // flex: 75,
                            child: Card(
                              color: fileDetails
                                  ? HexColor("#A4E4E6")
                                  : fDetails
                                      ? HexColor("#A4E4E6")
                                      : Colors.white,
                              // color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: fileDetails
                                        ? 75
                                        : fDetails
                                            ? 75
                                            : 100,
                                    child: Card(
                                      color: HexColor("#A4E4E6"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: fileTap,
                                                onDoubleTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FileScreen()));
                                                },
                                                child: Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/file.png",
                                                                height: 100),
                                                            Text("File.txt",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        ))),
                                              ),
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: HexColor("#FFFFFF"),
                                                  margin: EdgeInsets.fromLTRB(
                                                      35.0, 30.0, 0, 0),
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          12, 5, 12, 5),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/file.png",
                                                              height: 100),
                                                          Text("File.txt",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#808080"),
                                                                  fontFamily:
                                                                      "b",
                                                                  fontSize: 18))
                                                        ],
                                                      ))),
                                              GestureDetector(
                                                onTap: folderTap,
                                                onDoubleTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FolderScreen()));
                                                },
                                                child: Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/folder.png",
                                                                height: 100),
                                                            Text("Folder",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        ))),
                                              ),
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: HexColor("#FFFFFF"),
                                                  margin: EdgeInsets.fromLTRB(
                                                      35.0, 30.0, 0, 0),
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          12, 5, 12, 5),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/folder.png",
                                                              height: 100),
                                                          Text("Folder",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#808080"),
                                                                  fontFamily:
                                                                      "b",
                                                                  fontSize: 18))
                                                        ],
                                                      )))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: HexColor("#FFFFFF"),
                                                  margin: EdgeInsets.fromLTRB(
                                                      35.0, 30.0, 0, 0),
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          12, 5, 12, 5),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/file.png",
                                                              height: 100),
                                                          Text("File.txt",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#808080"),
                                                                  fontFamily:
                                                                      "b",
                                                                  fontSize: 18))
                                                        ],
                                                      ))),
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: HexColor("#FFFFFF"),
                                                  margin: EdgeInsets.fromLTRB(
                                                      35.0, 30.0, 0, 0),
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          12, 5, 12, 5),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/file.png",
                                                              height: 100),
                                                          Text("File.txt",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#808080"),
                                                                  fontFamily:
                                                                      "b",
                                                                  fontSize: 18))
                                                        ],
                                                      )))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: HexColor("#FFFFFF"),
                                                  margin: EdgeInsets.fromLTRB(
                                                      35.0, 30.0, 0, 0),
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          12, 5, 12, 5),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/file.png",
                                                              height: 100),
                                                          Text("File.txt",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#808080"),
                                                                  fontFamily:
                                                                      "b",
                                                                  fontSize: 18))
                                                        ],
                                                      ))),
                                              Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: HexColor("#FFFFFF"),
                                                  margin: EdgeInsets.fromLTRB(
                                                      35.0, 30.0, 0, 0),
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          12, 5, 12, 5),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/file.png",
                                                              height: 100),
                                                          Text("File.txt",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#808080"),
                                                                  fontFamily:
                                                                      "b",
                                                                  fontSize: 18))
                                                        ],
                                                      ))),
                                            ],
                                          ),
                                          SizedBox(height: 30)
                                        ],
                                      ),
                                    ),
                                  ),
                                  fDetails == true || fileDetails == true
                                      ? Expanded(
                                          flex: fileDetails
                                              ? 25
                                              : fDetails
                                                  ? 25
                                                  : 0,
                                          child: Card(
                                              color: HexColor("#F3F3F3"),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  35),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  35))),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    SizedBox(height: 18),
                                                    Row(
                                                      children: [
                                                        SizedBox(width: 10),
                                                        GestureDetector(
                                                          onTap: fileDetails
                                                              ? closeFileTap
                                                              : fDetails
                                                                  ? closeFolderTap
                                                                  : null,
                                                          child: Image.asset(
                                                              "assets/images/close_g.png",
                                                              height: 30),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Center(
                                                      child: Row(
                                                        children: [
                                                          Spacer(),
                                                          Card(
                                                            color: Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16)),
                                                            // margin:
                                                            //     EdgeInsets.all(10),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      85,
                                                                      25,
                                                                      85,
                                                                      25),
                                                              child: Text(
                                                                fileDetails
                                                                    ? "File.txt"
                                                                    : fDetails
                                                                        ? "Folder"
                                                                        : "",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        20,
                                                                    color: HexColor(
                                                                        "#565656")),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer()
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 30),
                                                    Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Spacer(),
                                                        Card(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    0),
                                                            color: HexColor(
                                                                "#F85D5D"),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            16),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            16))),
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            16,
                                                                            5,
                                                                            16,
                                                                            5),
                                                                child: Column(
                                                                  children: [
                                                                    Image.asset(
                                                                        "assets/images/delete_w.png",
                                                                        height:
                                                                            75),
                                                                    Text(
                                                                        "Delete",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "sfui",
                                                                            fontSize:
                                                                                18.5,
                                                                            color:
                                                                                HexColor("#FFFFFF")))
                                                                  ],
                                                                ))),
                                                        Card(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    0),
                                                            color: HexColor(
                                                                "#47BBF6"),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            16),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            16))),
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            16,
                                                                            5,
                                                                            16,
                                                                            5),
                                                                child: Column(
                                                                  children: [
                                                                    Image.asset(
                                                                        "assets/images/restore_2.png",
                                                                        height:
                                                                            75),
                                                                    Text(
                                                                        "Delete",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "sfui",
                                                                            fontSize:
                                                                                18.5,
                                                                            color:
                                                                                HexColor("#FFFFFF")))
                                                                  ],
                                                                ))),
                                                        Spacer()
                                                      ],
                                                    )),
                                                    SizedBox(height: 30),
                                                    Center(
                                                        child: Row(
                                                      children: [
                                                        Spacer(),
                                                        Card(
                                                          color: Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          // margin:
                                                          //     EdgeInsets.all(10),
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      50,
                                                                      25,
                                                                      50,
                                                                      70),
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        0.0),
                                                                width: width25,
                                                                child: Column(
                                                                  children: [
                                                                    // SizedBox(height: 10,),
                                                                    Text(
                                                                        "Details",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "b",
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                HexColor("#565656"))),

                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            "Name: File.txt",
                                                                            style: TextStyle(
                                                                                fontFamily: "b",
                                                                                fontSize: 14,
                                                                                color: HexColor("#565656"))),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                            "Path: C://Users/MYPC/NewFolder/File.txt",
                                                                            style: TextStyle(
                                                                                fontFamily: "b",
                                                                                fontSize: 14,
                                                                                color: HexColor("#565656"))),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                            "Size: 2 MB",
                                                                            style: TextStyle(
                                                                                fontFamily: "b",
                                                                                fontSize: 14,
                                                                                color: HexColor("#565656"))),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        fileDetails
                                                                            ? Text("Extension: TXT",
                                                                                style: TextStyle(fontFamily: "b", fontSize: 14, color: HexColor("#565656")))
                                                                            : fDetails
                                                                                ? Text("No Of Folders: 0", style: TextStyle(fontFamily: "b", fontSize: 14, color: HexColor("#565656")))
                                                                                : Text(""),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        fDetails
                                                                            ? Text("No Of Files: 2",
                                                                                style: TextStyle(fontFamily: "b", fontSize: 14, color: HexColor("#565656")))
                                                                            : Text(""),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                        Spacer()
                                                      ],
                                                    )),
                                                    SizedBox(height: 50),
                                                  ])))
                                      : Text("")
                                ],
                              ),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
        FlutterWebScroller(
          //Pass a reference to the ScrollCallBack function into the scrollbar
          scrollCallBack,

          //Add optional values
          scrollBarBackgroundColor: Colors.white,
          scrollBarWidth: 20.0,
          dragHandleColor: Colors.lightBlue,
          dragHandleBorderRadius: 2.0,
          dragHandleHeight: 40.0,
          dragHandleWidth: 15.0,
        ),
      ],
    ));
  }
}

class FileScreen extends StatefulWidget {
  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  void scrollCallBack(DragUpdateDetails dragUpdate) {
    ScrollController _controller;

    @override
    void initState() {
      //Initialize the  scrollController
      _controller = ScrollController();
      super.initState();
    }

    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width * 0.9;
    double height100 = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Expanded(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/sideLogo.jpg",
                            height: 70, fit: BoxFit.fill),
                        SizedBox(width: 30),
                        Text("Wednesday 10:22",
                            style: TextStyle(
                                fontFamily: "SergoeUI_bold",
                                color: HexColor("#565656"),
                                fontSize: 22))
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: HexColor("#00D5DC"),
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Image.asset("assets/images/refresh.jpg",
                                height: 25, fit: BoxFit.fill),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: HexColor("#00D5DC"),
                            margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("Light Mode"),
                            )),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: HexColor("#F1F1F1"),
                          margin: EdgeInsets.all(4),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                              child: Row(
                                children: [
                                  Text("HOST-PC NAME",
                                      style: TextStyle(
                                          fontFamily: "SergoeUI",
                                          color: HexColor("#808080")))
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width,
                animation: true,
                animationDuration: 1000,
                lineHeight: 10.0,
                // leading: new Text("left content"),
                // trailing: new Text("right content"),
                percent: 0.2,
                // center: Text("20.0%"),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: HexColor("#00EDFF"),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Expanded(
                      child: Card(
                    // margin: EdgeInsets.all(20),
                    color: HexColor("#A4E4E6"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              // height: 42,
                              width: width100,
                              margin: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        "assets/images/back_2.png",
                                        height: 70),
                                  ),
                                  SizedBox(width: 10),
                                  Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 3, 20, 3),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/file.png",
                                              height: 60),
                                          Text("File.txt",
                                              style: TextStyle(
                                                  fontFamily: "b",
                                                  fontSize: 25,
                                                  color: HexColor("#565656")))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Card(
                                      margin: EdgeInsets.all(0),
                                      color: HexColor("#F85D5D"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 3),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                                "assets/images/delete_w.png",
                                                height: 40),
                                            Text("Delete",
                                                style: TextStyle(
                                                  fontFamily: "sfui",
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      )),
                                  Card(
                                      margin: EdgeInsets.all(0),
                                      color: HexColor("#47BBF6"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 3),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                                "assets/images/delete_w.png",
                                                height: 40),
                                            Text("Restore",
                                                style: TextStyle(
                                                  fontFamily: "sfui",
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              height: height100,
                              width: width100,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [Text("HELLLOOOOO")],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              )
            ],
          ))),
        )
      ],
    ));
  }
}

class FolderScreen extends StatefulWidget {
  @override
  _FolderScreenState createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  void scrollCallBack(DragUpdateDetails dragUpdate) {
    ScrollController _controller;

    @override
    void initState() {
      //Initialize the  scrollController
      _controller = ScrollController();
      super.initState();
    }

    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  bool fileDetails = false;
  bool fDetails = false;

  void fileTap() {
    setState(() {
      fDetails = false;
      fileDetails = true;
    });
  }

  void folderTap() {
    setState(() {
      fileDetails = false;
      fDetails = true;
      print(fDetails);
    });
  }

  void closeFileTap() {
    setState(() {
      fileDetails = false;
    });
  }

  void closeFolderTap() {
    setState(() {
      fDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width100 = MediaQuery.of(context).size.width * 0.9;
    double height100 = MediaQuery.of(context).size.height * 0.8;
    double width25 = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Expanded(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/sideLogo.jpg",
                            height: 70, fit: BoxFit.fill),
                        SizedBox(width: 30),
                        Text("Wednesday 10:22",
                            style: TextStyle(
                                fontFamily: "SergoeUI_bold",
                                color: HexColor("#565656"),
                                fontSize: 22))
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: HexColor("#00D5DC"),
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Image.asset("assets/images/refresh.jpg",
                                height: 25, fit: BoxFit.fill),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: HexColor("#00D5DC"),
                            margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("Light Mode"),
                            )),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: HexColor("#F1F1F1"),
                          margin: EdgeInsets.all(4),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                              child: Row(
                                children: [
                                  Text("HOST-PC NAME",
                                      style: TextStyle(
                                          fontFamily: "SergoeUI",
                                          color: HexColor("#808080")))
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width,
                animation: true,
                animationDuration: 1000,
                lineHeight: 10.0,
                // leading: new Text("left content"),
                // trailing: new Text("right content"),
                percent: 0.2,
                // center: Text("20.0%"),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: HexColor("#00EDFF"),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Expanded(
                      child: Card(
                    // margin: EdgeInsets.all(20),
                    color: HexColor("#A4E4E6"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              // height: 42,
                              width: width100,
                              margin: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        "assets/images/back_2.png",
                                        height: 70),
                                  ),
                                  SizedBox(width: 10),
                                  Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 3, 20, 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/folder.png",
                                              height: 60),
                                          Text("Folder",
                                              style: TextStyle(
                                                  fontFamily: "b",
                                                  fontSize: 25,
                                                  color: HexColor("#565656")))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Card(
                                      margin: EdgeInsets.all(0),
                                      color: HexColor("#F85D5D"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 3),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                                "assets/images/delete_w.png",
                                                height: 40),
                                            Text("Delete",
                                                style: TextStyle(
                                                  fontFamily: "sfui",
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      )),
                                  Card(
                                      margin: EdgeInsets.all(0),
                                      color: HexColor("#47BBF6"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 3),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                                "assets/images/delete_w.png",
                                                height: 40),
                                            Text("Restore",
                                                style: TextStyle(
                                                  fontFamily: "sfui",
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: fileDetails
                                ? EdgeInsets.fromLTRB(20, 20, 0, 20)
                                : fDetails
                                    ? EdgeInsets.fromLTRB(20, 20, 0, 20)
                                    : const EdgeInsets.all(0.0),
                            child: Container(
                              // height: height100,
                              // width: width100,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: fileDetails
                                        ? 75
                                        : fDetails
                                            ? 75
                                            : 100,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: HexColor("#B1E0FF"),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: fileTap,
                                                  onDoubleTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FileScreen()));
                                                  },
                                                  child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                      color:
                                                          HexColor("#FFFFFF"),
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              35.0, 30.0, 0, 0),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  12, 5, 12, 5),
                                                          child: Column(
                                                            children: [
                                                              Image.asset(
                                                                  "assets/images/file.png",
                                                                  height: 100),
                                                              Text("File.txt",
                                                                  style: TextStyle(
                                                                      color: HexColor(
                                                                          "#808080"),
                                                                      fontFamily:
                                                                          "b",
                                                                      fontSize:
                                                                          18))
                                                            ],
                                                          ))),
                                                ),
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/file.png",
                                                                height: 100),
                                                            Text("File.txt",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        ))),
                                                GestureDetector(
                                                  onTap: folderTap,
                                                  onDoubleTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FolderScreen()));
                                                  },
                                                  child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                      color:
                                                          HexColor("#FFFFFF"),
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              35.0, 30.0, 0, 0),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  12, 5, 12, 5),
                                                          child: Column(
                                                            children: [
                                                              Image.asset(
                                                                  "assets/images/folder.png",
                                                                  height: 100),
                                                              Text("Folder",
                                                                  style: TextStyle(
                                                                      color: HexColor(
                                                                          "#808080"),
                                                                      fontFamily:
                                                                          "b",
                                                                      fontSize:
                                                                          18))
                                                            ],
                                                          ))),
                                                ),
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/folder.png",
                                                                height: 100),
                                                            Text("Folder",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        )))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/file.png",
                                                                height: 100),
                                                            Text("File.txt",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        ))),
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/file.png",
                                                                height: 100),
                                                            Text("File.txt",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        )))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/file.png",
                                                                height: 100),
                                                            Text("File.txt",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        ))),
                                                Card(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    color: HexColor("#FFFFFF"),
                                                    margin: EdgeInsets.fromLTRB(
                                                        35.0,
                                                        30.0,
                                                        0,
                                                        0),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 5, 12, 5),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                                "assets/images/file.png",
                                                                height: 100),
                                                            Text("File.txt",
                                                                style: TextStyle(
                                                                    color: HexColor(
                                                                        "#808080"),
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        18))
                                                          ],
                                                        ))),
                                              ],
                                            ),
                                            SizedBox(height: 30)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  fDetails == true || fileDetails == true
                                      ? Expanded(
                                          flex: fileDetails
                                              ? 25
                                              : fDetails
                                                  ? 25
                                                  : 0,
                                          child: Card(
                                              color: HexColor("#F3F3F3"),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  35),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  35))),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    SizedBox(height: 18),
                                                    Row(
                                                      children: [
                                                        SizedBox(width: 10),
                                                        GestureDetector(
                                                          onTap: fileDetails
                                                              ? closeFileTap
                                                              : fDetails
                                                                  ? closeFolderTap
                                                                  : null,
                                                          child: Image.asset(
                                                              "assets/images/close_g.png",
                                                              height: 30),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Center(
                                                      child: Row(
                                                        children: [
                                                          Spacer(),
                                                          Card(
                                                            color: Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16)),
                                                            // margin:
                                                            //     EdgeInsets.all(10),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      85,
                                                                      25,
                                                                      85,
                                                                      25),
                                                              child: Text(
                                                                fileDetails
                                                                    ? "File.txt"
                                                                    : fDetails
                                                                        ? "Folder"
                                                                        : "",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "b",
                                                                    fontSize:
                                                                        20,
                                                                    color: HexColor(
                                                                        "#565656")),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer()
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 30),
                                                    Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Spacer(),
                                                        Card(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    0),
                                                            color: HexColor(
                                                                "#F85D5D"),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            16),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            16))),
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            16,
                                                                            5,
                                                                            16,
                                                                            5),
                                                                child: Column(
                                                                  children: [
                                                                    Image.asset(
                                                                        "assets/images/delete_w.png",
                                                                        height:
                                                                            75),
                                                                    Text(
                                                                        "Delete",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "sfui",
                                                                            fontSize:
                                                                                18.5,
                                                                            color:
                                                                                HexColor("#FFFFFF")))
                                                                  ],
                                                                ))),
                                                        Card(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    0),
                                                            color: HexColor(
                                                                "#47BBF6"),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            16),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            16))),
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            16,
                                                                            5,
                                                                            16,
                                                                            5),
                                                                child: Column(
                                                                  children: [
                                                                    Image.asset(
                                                                        "assets/images/restore_2.png",
                                                                        height:
                                                                            75),
                                                                    Text(
                                                                        "Delete",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "sfui",
                                                                            fontSize:
                                                                                18.5,
                                                                            color:
                                                                                HexColor("#FFFFFF")))
                                                                  ],
                                                                ))),
                                                        Spacer()
                                                      ],
                                                    )),
                                                    SizedBox(height: 30),
                                                    Center(
                                                        child: Row(
                                                      children: [
                                                        Spacer(),
                                                        Card(
                                                          color: Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          // margin:
                                                          //     EdgeInsets.all(10),
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      50,
                                                                      25,
                                                                      50,
                                                                      70),
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        0.0),
                                                                width: width25,
                                                                child: Column(
                                                                  children: [
                                                                    // SizedBox(height: 10,),
                                                                    Text(
                                                                        "Details",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "b",
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                HexColor("#565656"))),

                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            "Name: File.txt",
                                                                            style: TextStyle(
                                                                                fontFamily: "b",
                                                                                fontSize: 14,
                                                                                color: HexColor("#565656"))),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                            "Path: C://Users/MYPC/NewFolder/File.txt",
                                                                            style: TextStyle(
                                                                                fontFamily: "b",
                                                                                fontSize: 14,
                                                                                color: HexColor("#565656"))),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                            "Size: 2 MB",
                                                                            style: TextStyle(
                                                                                fontFamily: "b",
                                                                                fontSize: 14,
                                                                                color: HexColor("#565656"))),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        fileDetails
                                                                            ? Text("Extension: TXT",
                                                                                style: TextStyle(fontFamily: "b", fontSize: 14, color: HexColor("#565656")))
                                                                            : fDetails
                                                                                ? Text("No Of Folders: 0", style: TextStyle(fontFamily: "b", fontSize: 14, color: HexColor("#565656")))
                                                                                : Text(""),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        fDetails
                                                                            ? Text("No Of Files: 2",
                                                                                style: TextStyle(fontFamily: "b", fontSize: 14, color: HexColor("#565656")))
                                                                            : Text(""),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                        Spacer()
                                                      ],
                                                    )),
                                                    SizedBox(height: 50),
                                                  ])))
                                      : Text("")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              )
            ],
          ))),
        )
      ],
    ));
  }
}

