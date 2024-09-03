import 'package:book_finder_flutter_demo/core/index.dart';
import 'package:book_finder_flutter_demo/src/auth/presentation/providers/auth_provider.dart';
import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController birthdateCtrl = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String? gender;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final providerUser = Provider.of<AuthProvider>(context, listen: false);
      if (providerUser.flagFillForm) {
        nameCtrl.text = providerUser.name;
        lastNameCtrl.text = providerUser.lastNames;
        phoneCtrl.text = providerUser.phone;
        emailCtrl.text = providerUser.email;
        birthdateCtrl.text = providerUser.birthdate;
        gender = providerUser.gender;
        setState(() {
          
        });
      } else {
        gender = null;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    lastNameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    birthdateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My account', 
          style: UxBfTextStyle.headingH3OpenSans,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30
          ),
          child: Form(
            key: _form,
            child: ListView(
              children: [
                UxBfInput(
                  controller: nameCtrl,
                  label: 'Names *',
                  keyboardType: TextInputType.name,
                  hintText: '',
                  validator: (value) => Validators.validate(
                    validators: ['required', 'text'],
                    value: value
                  )
                ),
                UxBfInput(
                  controller: lastNameCtrl,
                  label: 'Last names *',
                  keyboardType: TextInputType.name,
                  validator: (value) => Validators.validate(
                    validators: ['required', 'text'],
                    value: value
                  )
                ),
                UxBfInput(
                  controller: phoneCtrl,
                  label: 'Phone number *',
                  keyboardType: TextInputType.number,
                  validator: (value) => Validators.validate(
                    validators: ['required', 'number'],
                    value: value
                  )
                ),
                UxBfInput(
                  controller: emailCtrl,
                  label: 'Email *',
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'user@email.com',
                  validator: (value) => Validators.validate(
                    validators: ['required', 'email'],
                    value: value
                  )
                ),
                UxBfInputDate(
                  controller: birthdateCtrl,
                  label: 'Birthdate *',
                  hintText: 'Format dd/mm/yyyy',
                  validator: (value) => Validators.validate(
                    validators: ['required', 'birthdate'],
                    value: value
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return UxBfDropdown(
                      value: gender,
                      label: 'Gender *',
                      items: const ['Male', 'Female'],
                      hintText: 'Select your gender',
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        gender = value;
                        setState(() {});
                      },
                    );
                  }
                ),
                const SizedBox(height: 20)
              ]
            )
          ),
        )
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25
          ),
          child: UxBfButton(
            label: 'Save',
            onPressed: () {
              if (!_form.currentState!.validate()) {
                return;
              }
              context.pop();
              providerUser.setUserInfo(
                name: nameCtrl.value.text, 
                lastNames: lastNameCtrl.value.text, 
                phone: phoneCtrl.value.text, 
                email: emailCtrl.value.text, 
                birthdate: birthdateCtrl.value.text, 
                gender: gender ?? ''
              );
              LocalStorageHandler.saveUserInfoLocalStorage(
                name: nameCtrl.value.text, 
                lastNames: lastNameCtrl.value.text, 
                phone: phoneCtrl.value.text, 
                email: emailCtrl.value.text, 
                birthdate: birthdateCtrl.value.text, 
                gender: gender ?? '',
                flagFillForm: true
              );
            },
          ),
        )
      ),
    );
  }
}