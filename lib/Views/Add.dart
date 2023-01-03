import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Models/Globals.dart';

class Spage extends StatefulWidget {
  const Spage({Key? key}) : super(key: key);

  @override
  State<Spage> createState() => _SpageState();
}

class _SpageState extends State<Spage> {
  File? _image;
  ImagePicker pick = ImagePicker();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? Fname1;
  String? Lname1;
  String? Phone1;
  String? Email1;

  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();

  getImageFromGallary() async {
    XFile? xfile = await pick.pickImage(source: ImageSource.gallery);
    String path = xfile!.path;
    setState(() {
      _image = File(path);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            ),),
        title: Text(
          "Add",
          style: TextStyle(
              fontSize: 20,
              color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
              fontWeight: FontWeight.bold),
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

                  Contact c = Contact(
                    firstname: Fname1,
                    lastname: Lname1,
                    phonenumber: Phone1,
                    email: Email1,
                    Image: _image,
                  );
                  Global.piyu.add(c);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('Myapp', (route) => false);
                }
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Stack(
                alignment: const Alignment(1, 1),
                children: [
                  (_image != null)
                      ? CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[400],
                          backgroundImage:
                              (_image != null) ? FileImage(_image!) : null,
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.shade600,
                          child: Image.asset("assets/images/profile.png")),
                  InkWell(
                    onTap: () {
                      getImageFromGallary();
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 75, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Fname,
                  style: TextStyle( color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                  ),
                  cursorColor: const Color(0xffd67848),
                  cursorRadius: const Radius.circular(10),
                  onSaved: (val) {
                    setState(() {
                      Fname1 = val;
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
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Lname,
                  style: TextStyle( color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),),
                  onSaved: (val) {
                    setState(() {
                      Lname1 = val;
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
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Phone,
                  style: TextStyle( color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),),
                  onSaved: (val) {
                    setState(() {
                      Phone1 = val;
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
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      prefixIcon: Icon(
                        Icons.call_outlined,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Email,
                  style: TextStyle( color:
                  (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),),
                  onSaved: (val) {
                    setState(() {
                      Email1 = val;
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
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color:
                        (Global.isDark == false) ? Colors.black : const Color(0xffD6E4E5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: (Global.isDark == false) ? const Color(0xffF1EEE9) : const Color(0xff474E68),
    );
  }
}
