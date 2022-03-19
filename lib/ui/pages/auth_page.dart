import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);


  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    super.initState();
  }

  final bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _pseudoController = TextEditingController();
  final _passwordController = TextEditingController();
  late Future<http.Response> _serverResponse;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill,),
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Image.asset("assets/images/logo.png", width: MediaQuery.of(context).size.width * 0.35,),
            ),
            const Text("\n"),
            const Center(
              child: Text("CONNEXION", style: TextStyle(color: Colors.white)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _pseudoController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: Icon(Icons.supervised_user_circle, color: Colors.white,),
                          labelText: "Pseudonyme",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pseudonyme requis';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: Icon(Icons.security, color: Colors.white,),
                          labelText: "Mot de passe",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mot de pass requis';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                      OutlineButton(
                          textColor: Colors.white,
                          child: const Text("mot de passe oublé ?", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),),
                          onPressed: ()  => _displayBottomSheet(context, )
                      ),
                    ),
                    _isLoading ? const CircularProgressIndicator() :
                    const Text('\n'),
                    const OutlineButton(
                      child: Text("CONNEXION", style: TextStyle(color: Colors.white, shadows: [Shadow(color: Colors.white, blurRadius: 10.0, offset: Offset.infinite)]),),
                      //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)  => HomePage())),
                      onPressed: null,
                      borderSide: BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.solid),
                    ),
                    const Text(""),
                    const Text("OU", style: TextStyle(color: Colors.white),),
                    const Text(""),
                    Image.asset("assets/images/fingerprint.png", width: 35.0,),
                    const Text(""),
                    const OutlineButton(
                        textColor: Colors.white,
                        child: Text("VOUS N'AVEZ PAS DE COMPTE", style: TextStyle(fontStyle: FontStyle.italic, decoration: TextDecoration.underline, color: Colors.white),),
                        onPressed: null
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void _displayBottomSheet(BuildContext context) {

  final _passForgottenFormKey = GlobalKey<FormState>();
  var topSheetRadius = 15.0;
  var deviceHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      context: context,
      builder: (ctx) {
        return Container(
          height: deviceHeight*0.25,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(topSheetRadius), topRight: Radius.circular(topSheetRadius))
          ),
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.9),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(topSheetRadius), topRight: Radius.circular(topSheetRadius))
                  ),
                  child: const Align(child: Text('Mot de passe Oublié', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), alignment: Alignment.center,)
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Form(
                  key: _passForgottenFormKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Votre e-mail d'inscription",
                      ),
                    ),
                    const Text(''),
                    const OutlineButton(
                      child: Text('Envoyer'),
                      onPressed: null,
                    )
                  ],),
                ),
              )
            ],
          ),
        );
      });
}
