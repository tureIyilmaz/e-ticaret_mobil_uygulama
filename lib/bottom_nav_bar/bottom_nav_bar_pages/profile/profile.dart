import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'register.dart';

final _formKey = GlobalKey<FormState>();

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: const Color(0xFFf0f5f5),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 700,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/courusel/logo.png',
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Telefon Numarası',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'TR',
                  onChanged: (phone) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Lütfen şifrenizi giriniz.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Geçerli bir şifre giriniz.";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Şifremi unuttum",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Giriş yap",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[100],
                      ),
                      onPressed: () async {
                        final result = await FacebookAuth.instance.login();
                        if (result.status == LoginStatus.success) {
                        } else {}
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Facebbok\n ile bağlan',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[100],
                      ),
                      onPressed: () async {
                        // ignore: no_leading_underscores_for_local_identifiers
                        final GoogleSignIn _googleSignIn = GoogleSignIn();
                        try {
                          final result = await _googleSignIn.signIn();
                          if (result != null) {}
                          // ignore: empty_catches
                        } catch (error) {}
                      },
                      child: const Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Google\n ile bağlan',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Üye olmak için"),
                    TextButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(builder: (context) {
                          return const Register();
                        });
                        Navigator.push(context, route);
                      },
                      child: const Text(
                        "Tıklayınız...",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
