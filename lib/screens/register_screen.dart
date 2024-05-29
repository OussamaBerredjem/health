import 'package:health/services/auth_service.dart';

import '../shared/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/app_button.dart';
import '../utils/constants.dart';
import '../utils/utilis.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureTextFieldOne = true;
  bool _obscureTextFieldTwo = true;
  bool loading = false;
  bool isPatient = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController(),
      _firstNameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _adressController = TextEditingController(),
      _genderController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _specialtyController = TextEditingController();// Champ de spécialité médicale

  AuthService authService = AuthService();
  bool isSemep = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Commencer",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: secondaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "en créant un compte gratuit",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: secondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              controller: _firstNameController,
                              style: textStyleInput,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: Icon(
                                  CupertinoIcons.person,
                                ),
                                hintText: "Prénom",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              controller: _lastNameController,
                              style: textStyleInput,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: Icon(
                                  CupertinoIcons.person,
                                ),
                                hintText: "Nom",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              controller: _adressController,
                              style: textStyleInput,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: Icon(
                                  CupertinoIcons.location,
                                ),
                                hintText: "Adresse",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              controller: _phoneNumberController,
                              style: textStyleInput,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: Icon(
                                  CupertinoIcons.phone,
                                ),
                                hintText: "Numéro de téléphone",
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              controller: _emailController,
                              style: textStyleInput,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                if (!StringUtil.isValidEmail(value)) {
                                  return "L'e-mail n'est pas valide";
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: Icon(
                                  CupertinoIcons.at,
                                ),
                                hintText: "E-mail",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                return null;
                              },
                              style: textStyleInput,
                              controller: _passwordController,
                              obscureText: _obscureTextFieldOne,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Mot de passe",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextFieldOne =
                                          !_obscureTextFieldOne;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextFieldOne
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                if (value != _passwordController.text) {
                                  return "Mot de passe différent";
                                }
                                return null;
                              },
                              style: textStyleInput,
                              controller: _passwordControllerConfirm,
                              obscureText: _obscureTextFieldTwo,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Confirmez le mot de passe",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextFieldTwo =
                                          !_obscureTextFieldTwo;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextFieldTwo
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          if (!isPatient) // Affiche le champ de spécialité médicale uniquement pour les médecins
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: TextFormField(
                                controller: _specialtyController,
                                style: textStyleInput,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Ce champ est obligatoire pour les médecins";
                                  }
                                  return null;
                                },
                                decoration:  InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.medical_services,
                                  ),
                                  hintText: "Spécialité médicale",
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: isPatient,
                                    onChanged: (value) {
                                      setState(() {
                                        isPatient = value as bool;
                                      });
                                    },
                                  ),
                                  const Text('Semep'),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: false,
                                    groupValue: isPatient,
                                    onChanged: (value) {
                                      setState(() {
                                        isPatient = value as bool;
                                      });
                                    },
                                  ),
                                  const Text('Doctor'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          // Procédez avec l'inscription
                          Navigator.pop(context);

                        }
                      },
                      label: "S'inscrire",
                      scrIcon: Icons.app_registration,
                      buttonType: ButtonType.PRIMARY,
                      width: size.width,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 1),

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async{
                if(formKey.currentState!.validate()){
                  await authService.Signup(_firstNameController.text, _lastNameController.text, _adressController.text, _phoneNumberController.text, _emailController.text, _passwordController.text, isPatient?"semep":"doctor",_specialtyController.text);
                  Navigator.pop(context);

                }
              },
              child: RichText(
                text: TextSpan(
                  text: 'Déjà membre? ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Se connecter',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontSize: 13,
                                color: primaryColor,
                                fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
