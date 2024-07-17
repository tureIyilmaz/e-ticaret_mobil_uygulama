import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üye ol'),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Align(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: const Color(0xFFf0f5f5),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 700,
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
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
                      height: 10,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      child: const Text(
                          'Şifreniz en az 7 karakter içermektedir, harf ve rakam içermektedir.'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Cinsiyet'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Kadın'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Erkek'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text(
                            "Verilerimin işlenmesine ve paylaşılmasına \n açık riza veriyorum."),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text(
                            "Tarafıma elektronik ileti gönderilmesini\n kabul ediyorum."),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text("Aydınlatma metnini okudum ve anladım."),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Üye ol'a basarak'"),
                        TextButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(builder: (context) {
                              return const Register();
                            });
                            Navigator.push(context, route);
                          },
                          child: const Text(
                            "Üyelik Koşullarını",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const Text("'nı kabul ediyorum"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Üye ol",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                                'Facebbok\n ile üye ol',
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
                            final GoogleSignIn googleSignIn = GoogleSignIn();
                            try {
                              final result = await googleSignIn.signIn();
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
                                'Google\n ile üye ol',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Üye misin?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Giriş Yap",
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
        ),
      ),
    );
  }
}
