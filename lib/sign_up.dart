import 'package:ele_cart_e_commerce_app/login.dart';
import 'package:ele_cart_e_commerce_app/template.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                "Sign Up",
                style: TextStyle(
                    color: Color(0xff583D72),
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                // controller: passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                obscureText: true,
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                obscureText: true,
                // controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Re-enter password',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(top: 10),
              child: MaterialButton(
                textColor: Colors.white,
                color: const Color(0xff583D72),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TemplateView()));
                },
              ),
            ),
            Row(
              children: [
                const Text('Already have an account?'),
                MaterialButton(
                  textColor: const Color(0xffFF8474),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
