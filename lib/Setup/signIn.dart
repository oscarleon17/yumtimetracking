import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yum_time_tracking/Pages/home.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email, _password, _errorMessage;
  bool _isIos;
  bool _isLoading;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('YUM! Timetracking'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            _showBody(),
            _showCircularProgress(),
          ],
        ));
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  Widget _showCircularProgress(){
    if(_isLoading){
      return Center(child: CircularProgressIndicator());
    } return Container(height: 0.0, width: 0.0,);
  }

  Widget _showBody(){
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
              //_showSecondaryButton(),
              _showErrorMessage(),
            ],
          ),
        ));
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/yumlogo.png'),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.red,
            child: new Text(
                'Login', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: signIn,
          ),
        ));
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('YUM! Timetracking'),
//        centerTitle: true,
//      ),
//      body: Form(
//        key: _formKey,
//        child: Column(
//          children: <Widget>[
//            TextFormField(
//              validator: (input){
//                if(input.isEmpty){
//                  return 'Please type a correct email format';
//                }
//              },
//              onSaved: (input) => _email = input,
//              decoration: InputDecoration(
//                labelText: 'Email'
//              ),
//            ),
//            TextFormField(
//              validator: (input){
//                if(input.length < 6){
//                  return 'Please provide a password greater than six characters';
//                }
//              },
//              onSaved: (input) => _password = input,
//              decoration: InputDecoration(
//                  labelText: 'Password'
//              ),
//              obscureText: true,
//            ),
//            RaisedButton(
//              onPressed: signIn ,
//              child: Text('Sign In'),
//            )
//          ],
//        ),
//      ),
//    );
//  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));

        setState(() {
          _isLoading = false;
        });

      }catch(e){
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if(_isIos){
            _errorMessage = e.details;
          } else{
            _errorMessage = e.message;
          }
        });
      }

    }
  }
}
