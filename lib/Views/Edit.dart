import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Models/Globals.dart';

class Fpage extends StatefulWidget {
  const Fpage({Key? key}) : super(key: key);

  @override
  State<Fpage> createState() => _FpageState();
}

class _FpageState extends State<Fpage> {
  bool q = true;

  File? _image;
  ImagePicker pick = ImagePicker();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? Fname2;
  String? Lname2;
  String? Phone2;
  String? Email2;

  TextEditingController Fname00 = TextEditingController();
  TextEditingController Lname00 = TextEditingController();
  TextEditingController Phone00 = TextEditingController();
  TextEditingController Email00 = TextEditingController();

  getImageFromGallary() async {
    XFile? xfile = await pick.pickImage(source: ImageSource.gallery);
    String path = xfile!.path;
    setState(() {
      _image = File(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic tick = ModalRoute.of(context)!.settings.arguments;

    Fname00.text = tick.firstname;
    Lname00.text = tick.lastname;
    Phone00.text = tick.phonenumber;
    Email00.text = tick.email;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            )),
        title: const Text(
          "Edit Contact",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
          GestureDetector(
            onTap: () {
              setState(() {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  Contact ca = Contact(
                    firstname: Fname2,
                    lastname: Lname2,
                    phonenumber: Phone2,
                    email: Email2,
                    Image: _image,
                  );
                  int a = Global.piyu.indexOf(tick);
                  Global.piyu[a] = ca;
                }
                setState(() {
                  Navigator.pushReplacementNamed(context, "Myapp");
                });
              });
            },
            child: Icon(
              Icons.check,
              color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: const Alignment(1, 0.9),
              children: [
                (q)
                    ? (tick.Image != null)
                        ? CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey[400],
                            backgroundImage: (tick.Image != null)
                                ? FileImage(tick.Image!)
                                : null,
                          )
                        : Image.asset("assets/images/profile.png",
                            height: 130, color: Colors.black)
                    : (_image != null)
                        ? CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey[400],
                            backgroundImage:
                                (_image != null) ? FileImage(_image!) : null,
                          )
                        : Image.asset("assets/images/3.png"),
                FloatingActionButton(
                    mini: true,
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() async {
                        getImageFromGallary();
                        q = false;
                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 75, 30, 25),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: Fname00,
                style: TextStyle(
                  color: (Global.isDark == false)
                      ? Colors.black
                      : const Color(0xffD6E4E5),
                ),
                cursorColor: const Color(0xffd67848),
                cursorRadius: const Radius.circular(10),
                onSaved: (val) {
                  setState(() {
                    Fname2 = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your first name";
                  }
                },
                decoration: InputDecoration(
                    hintText: "First Name",
                    fillColor: Colors.black54,
                    filled: true,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: (Global.isDark == false)
                          ? Colors.black
                          : const Color(0xffD6E4E5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: Lname00,
                style: TextStyle(
                  color: (Global.isDark == false)
                      ? Colors.black
                      : const Color(0xffD6E4E5),
                ),
                onSaved: (val) {
                  setState(() {
                    Lname2 = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your last name";
                  }
                },
                cursorColor: const Color(0xffd67848),
                cursorRadius: const Radius.circular(10),
                decoration: InputDecoration(
                    hintText: "Last Name",
                    fillColor: Colors.black54,
                    filled: true,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: (Global.isDark == false)
                          ? Colors.black
                          : const Color(0xffD6E4E5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: Phone00,
                style: TextStyle(
                  color: (Global.isDark == false)
                      ? Colors.black
                      : const Color(0xffD6E4E5),
                ),
                onSaved: (val) {
                  setState(() {
                    Phone2 = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your phone";
                  }
                },
                keyboardType: TextInputType.number,
                cursorColor: const Color(0xffd67848),
                cursorRadius: const Radius.circular(10),
                decoration: InputDecoration(
                    hintText: "Phone number",
                    fillColor: Colors.black54,
                    filled: true,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                    prefixIcon: Icon(
                      Icons.call_outlined,
                      color: (Global.isDark == false)
                          ? Colors.black
                          : const Color(0xffD6E4E5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: Email00,
                style: TextStyle(
                  color: (Global.isDark == false)
                      ? Colors.black
                      : const Color(0xffD6E4E5),
                ),
                onSaved: (val) {
                  setState(() {
                    Email2 = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your email";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                cursorColor: const Color(0xffd67848),
                cursorRadius: const Radius.circular(10),
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.black54,
                  filled: true,
                  hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: (Global.isDark == false)
                        ? Colors.black
                        : const Color(0xffD6E4E5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor:
          (Global.isDark == false) ? const Color(0xffF1EEE9) : const Color(0xff474E68),
    );
  }
}
