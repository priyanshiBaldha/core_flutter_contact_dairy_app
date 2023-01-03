import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/Globals.dart';

class Tpage extends StatefulWidget {
  const Tpage({Key? key}) : super(key: key);

  @override
  State<Tpage> createState() => _TpageState();
}

class _TpageState extends State<Tpage> {
  @override
  Widget build(BuildContext context) {
    dynamic edit = ModalRoute.of(context)!.settings.arguments;
    makecall() async {
      final Uri call = Uri(
        scheme: 'tel',
        path: '+91${edit.phonenumber}',
      );
      await launchUrl(call);
    }
    makesms() async {
      final Uri sms = Uri(
        scheme: 'sms',
        path: '+91${edit.phonenumber}',
      );
      await launchUrl(sms);
    }

    makeEmail() async {
      final Uri email = Uri(
        scheme: 'mailto',
        path: '${edit.email}',
      );
      await launchUrl(email);
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Icon(
              Icons.arrow_back,
              color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
            ),),
        title: Text(
          "Contacts",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            color: (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
            fontSize: 25,
          ),
        ),
        backgroundColor:
            (Global.isDark == false) ? const Color(0xffF1EEE9) : const Color(0xff474E68),
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
              color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
            ),
          ),
          Icon(
            Icons.more_vert,
            color: (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                (edit.Image == null)
                    ? Stack(
                        alignment: const Alignment(0.4, 0.7),
                        children: [
                          Image.asset("assets/images/profile.png",
                              height: 130, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(left: 300),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Global.piyu.remove(edit);
                                    Navigator.pushReplacementNamed(
                                        context, 'Myapp');
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 35,
                                ),),
                          ),
                        ],
                      )
                    : Stack(
                        alignment: const Alignment(0.5, 1),
                        children: [
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.grey[400],
                            backgroundImage: (edit.Image != null)
                                ? FileImage(edit.Image!)
                                : null,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 300),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Global.piyu.remove(edit);
                                  Navigator.pushReplacementNamed(
                                      context, 'Myapp');
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                (edit.Image == null)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 70, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context)
                                  .pushNamed('Fpage', arguments: edit);
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 140, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context)
                                  .pushNamed('Fpage', arguments: edit);
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "${edit.firstname} ${edit.lastname}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 65, 25, 20),
              child: Row(
                children: [
                  Text(
                    "+91 ${edit.phonenumber}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 23),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
              endIndent: 25,
              indent: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        makecall();
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.call, color: Color(0xff80ED99)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        makesms();
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.message, color: Colors.yellowAccent),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        makeEmail();
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.email,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() async {
                        await Share.share(
                            "Name:${edit.firstname} ${edit.lastname}\n+91 ${edit.phonenumber}");
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.share, color: Colors.orangeAccent),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
              endIndent: 25,
              indent: 25,
            ),
          ],
        ),
      ),
      backgroundColor:
          (Global.isDark == false) ? const Color(0xffF1EEE9) : const Color(0xff474E68),
    );
  }
}

