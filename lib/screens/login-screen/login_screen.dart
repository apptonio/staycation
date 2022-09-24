import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/shared/widgets/wide_button.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _auth = FirebaseAuth.instance;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.images.login),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Staycation',
                                        style: textTheme.headline5,
                                      ),
                                      const SizedBox(height: 10),
                                      Text('Get started for free',
                                          style: textTheme.bodyText2!.merge(
                                              TextStyle(
                                                  color: ThemeColors.gray500))),
                                      const SizedBox(height: 30),
                                      FormBuilder(
                                          key: _formKey,
                                          child: SingleChildScrollView(
                                              child: Column(children: [
                                            const SizedBox(height: 10),
                                            FormBuilderTextField(
                                              focusNode: _emailFocusNode,
                                              onTap: () {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);

                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                              },
                                              name: 'email',
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                labelStyle: TextStyle(
                                                    color: _emailFocusNode
                                                            .hasFocus
                                                        ? ThemeColors.coral500
                                                        : ThemeColors.gray500),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: ThemeColors
                                                            .gray200)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ThemeColors.coral500,
                                                  ),
                                                ),
                                              ),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators
                                                    .required(),
                                                FormBuilderValidators.email()
                                              ]),
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                            const SizedBox(height: 20),
                                            FormBuilderTextField(
                                              focusNode: _passwordFocusNode,
                                              onTap: () {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);

                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                              },
                                              name: 'password',
                                              decoration: InputDecoration(
                                                labelText: 'Password',
                                                labelStyle: TextStyle(
                                                    color: _passwordFocusNode
                                                            .hasFocus
                                                        ? ThemeColors.coral500
                                                        : ThemeColors.gray500),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: ThemeColors
                                                            .gray200)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ThemeColors.coral500,
                                                  ),
                                                ),
                                              ),
                                              validator: FormBuilderValidators
                                                  .required(),
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                            const SizedBox(height: 5),
                                            FormBuilderCheckbox(
                                              name: 'terms',
                                              title: Text(
                                                'I accept the Terms and Conditions',
                                                style: textTheme.bodyText1,
                                              ),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators.required(
                                                  errorText:
                                                      'You must accept terms and conditions to continue',
                                                ),
                                              ]),
                                            ),
                                            const SizedBox(height: 5),
                                            WideButton(
                                                title: 'LOG IN',
                                                action: () async {
                                                  UserCredential userCredential;
                                                  final validationCheck =
                                                      _formKey.currentState
                                                          ?.validate();
                                                  if (validationCheck != null &&
                                                      validationCheck) {
                                                    try {
                                                      userCredential = await _auth
                                                          .signInWithEmailAndPassword(
                                                              email: _formKey
                                                                  .currentState
                                                                  ?.fields[
                                                                      'email']
                                                                  ?.value,
                                                              password: _formKey
                                                                  .currentState
                                                                  ?.fields[
                                                                      'password']
                                                                  ?.value);
                                                      router.navigateTo(context,
                                                          Routes.homeScreen);
                                                    } on PlatformException catch (err) {
                                                      var message =
                                                          'An error occurred, please check your credentials';
                                                      if (err.message != null) {
                                                        message = err.message!;
                                                      }
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(message),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        margin: const EdgeInsets
                                                            .all(20.0),
                                                      ));
                                                    } catch (err) {
                                                      print(err);
                                                    }
                                                  }
                                                }),
                                            WideButton(
                                                title: 'SIGN IN',
                                                action: () async {
                                                  UserCredential userCredential;
                                                  final validationCheck =
                                                      _formKey.currentState
                                                          ?.validate();
                                                  if (validationCheck != null &&
                                                      validationCheck) {
                                                    try {
                                                      userCredential = await _auth
                                                          .createUserWithEmailAndPassword(
                                                              email: _formKey
                                                                  .currentState
                                                                  ?.fields[
                                                                      'email']
                                                                  ?.value,
                                                              password: _formKey
                                                                  .currentState
                                                                  ?.fields[
                                                                      'password']
                                                                  ?.value);
                                                      router.navigateTo(context,
                                                          Routes.homeScreen);
                                                    } on PlatformException catch (err) {
                                                      var message =
                                                          'An error occurred, please check your credentials';
                                                      if (err.message != null) {
                                                        message = err.message!;
                                                      }
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(message),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        margin: const EdgeInsets
                                                            .all(20.0),
                                                      ));
                                                    } catch (err) {
                                                      print(err);
                                                    }
                                                  }
                                                })
                                          ])))
                                    ],
                                  ))),
                        ))))));
  }
}

Future createUser() async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'mojmail@gmail.com',
      password: '12345678',
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}