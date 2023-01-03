import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Models/Globals.dart';
import 'Views/Add.dart';
import 'Views/Detail.dart';
import 'Views/Edit.dart';
import 'Views/splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: (Global.isDark == false) ? ThemeMode.light : ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const spl(),
        'Myapp': (context) => const Myapp(),
        'Spage': (context) => const Spage(),
        'Tpage': (context) => const Tpage(),
        'Fpage': (context) => const Fpage(),
      },
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.black,
      ),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              (Global.isDark == false) ? Colors.black54 : Colors.white54,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Navigator.of(context).pushNamed('Spage');
          },
          child: Icon(
            Icons.add,
            size: 45,
            color: (Global.isDark == false) ? Colors.white : Colors.black,
          )),
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            color: (Global.isDark == false)
                ? Colors.black
                : const Color(0xffD6E4E5),
            fontSize: 25,
          ),
        ),
        backgroundColor: (Global.isDark == false)
            ? const Color(0xffF1EEE9)
            : const Color(0xff474E68),
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Global.isDark = !Global.isDark;
              });
            },
            icon: Icon(
              Icons.circle,
              color: (Global.isDark == false)
                  ? Colors.black
                  : const Color(0xffD6E4E5),
            ),
          ),
          Icon(
            Icons.more_vert,
            color: (Global.isDark == false)
                ? Colors.black
                : const Color(0xffD6E4E5),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: (Global.piyu.isEmpty)
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: (Global.isDark == false)
                  ? const Color(0xffF1EEE9)
                  : const Color(0xff474E68),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        "assets/images/img.png",
                        color: (Global.isDark == false)
                            ? Colors.black
                            : const Color(0xffD6E4E5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "You have no contacts yet",
                    style: TextStyle(
                        color: (Global.isDark == false)
                            ? Colors.black
                            : const Color(0xffD6E4E5),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: ListView.builder(
                itemCount: Global.piyu.length,
                itemBuilder: (context, i) => ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(),
                    child: GestureDetector(
                      child: (Global.piyu[i].Image != null)
                          ? CircleAvatar(
                              backgroundImage: (Global.piyu[i].Image != null)
                                  ? FileImage(Global.piyu[i].Image!)
                                  : null,
                            )
                          : Container(
                              child: Icon(
                                Icons.person,
                                size: 30,
                                color: (Global.isDark == false)
                                    ? Colors.black
                                    : Color(0xffD6E4E5),
                              ),
                            ),
                    ),
                  ),
                  title: Text(
                    "${Global.piyu[i].firstname} ${Global.piyu[i].lastname}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      color: (Global.isDark == false)
                          ? Colors.black
                          : Color(0xffD6E4E5),
                    ),
                  ),
                  subtitle: Text(
                    "+91 ${Global.piyu[i].phonenumber} ",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: (Global.isDark == false)
                          ? Colors.black
                          : const Color(0xffD6E4E5),
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context)
                            .pushNamed('Tpage', arguments: Global.piyu[i]);
                      });
                    },
                    child: Icon(
                      Icons.info,
                      color: (Global.isDark == false)
                          ? Colors.black
                          : const Color(0xffD6E4E5),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
      backgroundColor: (Global.isDark == false)
          ? const Color(0xffF1EEE9)
          : const Color(0xff474E68),
    );
  }
}
