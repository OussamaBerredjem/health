import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/doctor_model.dart';
import 'package:health/services/doctor_provider.dart';
import 'package:provider/provider.dart';

import '../shared/background.dart';
import '../utils/constants.dart';
import '../utils/utilis.dart';


class AjouterDoctorScreen extends StatefulWidget {
  const AjouterDoctorScreen({Key? key}) : super(key: key);

  @override
  State<AjouterDoctorScreen> createState() => _AjouterDoctorScreenState();
}

class _AjouterDoctorScreenState extends State<AjouterDoctorScreen> {

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
      _phoneNumberController = TextEditingController(),
      _specialtyController = TextEditingController();// Champ de spécialité médicale

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter Doctor'),actions: [
        IconButton(onPressed: () async{

          if (formKey.currentState!.validate()) {
            DoctorModel mod = DoctorModel(nom: _firstNameController.text,prenom: _lastNameController.text,adress: _adressController.text,number: _phoneNumberController.text,id: "0", email: _emailController.text,specialite: _specialtyController.text);
            await Provider.of<DoctorProvider>(context,listen: false).addDoctor(mod,_passwordController.text);
            Navigator.pop(context);
          }



        }, icon: Icon(Icons.check,color: Colors.white,))
      ],),
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [

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

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
