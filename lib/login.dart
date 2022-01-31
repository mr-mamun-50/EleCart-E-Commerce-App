import 'dart:convert';

import 'package:ele_cart_e_commerce_app/sign_up.dart';
import 'package:ele_cart_e_commerce_app/template.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var msg = '';
  final box = GetStorage();

  loginReq() async {
    String url = 'https://api.ishaqi.com/customerlogin';
    Uri uri = Uri.parse(url);
    Map data = {
      'user_name': nameController.text,
      'password': passController.text,
    };

    var body = json.encode(data);

    var response = await http.post(uri, body: body, headers: {
      'Content-Type': 'application/json',
    });

    print(response.statusCode);
    print(response.body);
    var jsonString = jsonDecode(response.body);
    print(jsonString);
    msg = jsonString['message'];
    if (jsonString['status'] == 'SUCCESS') {
      box.write('token', jsonString['access_token']);
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const TemplateView()));
    }

    setState(() {});
  }

  bool showvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EleCart"),
        backgroundColor: const Color(0xff583D72),
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Image.asset('images/logo_40.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Color(0xff583D72),
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: showvalue,
                  onChanged: (value) {
                    setState(() {
                      showvalue = value!;
                    });
                  },
                ),
                const Text("Remember password"),
              ],
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text('Forgot Password'),
              textColor: const Color(0xffFF8474),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                textColor: Colors.white,
                color: const Color(0xff583D72),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  loginReq();
                },
              ),
            ),
            Row(
              children: [
                const Text('Does not have account?'),
                MaterialButton(
                  textColor: const Color(0xffFF8474),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
