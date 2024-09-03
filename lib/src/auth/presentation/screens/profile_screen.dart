import 'package:book_finder_flutter_demo/core/index.dart';
import 'package:book_finder_flutter_demo/src/auth/presentation/providers/auth_provider.dart';
import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: UxBfTextStyle.headingH3OpenSans,
          textAlign: TextAlign.start,
        ),
      ),
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, user, _) {        
          return Column(
            children: [
              UxBfUserProfile(
                user: '${user.name} ${user.lastNames}',
                years: DateHandler.getYearsOld(birthdate: user.birthdate).toString(),
                phone: '#${user.phone}\n${user.email}',
                image: getImageGender(user.gender),
              ),
              UxBfListItemProfile.myAccount(
                onTap: () {
                  context.push('/my-account');
                },
              ),
              const UxBfListItemProfile.helpCenter(),
              const UxBfListItemProfile.favorites()
            ],
          );
        })
      )
    );
  }

  String getImageGender(String gender) {
    if (gender == 'Male') {
      return 'man.png';
    }
    if (gender == 'Female') {
      return 'woman.png';
    }
    return 'user.png';
  }
}
