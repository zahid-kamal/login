import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email='';
  String password= '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator:validateEmail,
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      // obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'PwzT433!',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validatePassword,
      onSaved: (value) {
       password= value!;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      elevation: 10,
      color: Colors.blue,
      child: Text('Log in'),
      onPressed: () {
       if(formKey.currentState?.validate()==true){
         formKey.currentState?.save();
         print('Time to post $email and $password to my API');
       }
      }
    );
  }
}
