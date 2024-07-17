import 'package:al_rasef/features/Setings/presentation/views/widget/personal_view_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import 'list_item.dart';

class AcountViewBody extends StatelessWidget {
  const AcountViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,

              fontWeight: FontWeight.w600,

            ),
            textAlign: TextAlign.end,
          ),
         const SizedBox(
            height: 15,
          ),
         const Text(
            'Personal Detail',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,

              fontWeight: FontWeight.w600,
            ),
          ),
         const  SizedBox(
            height: 10,
          ),
         PersonalViewCard(),
        const   ListItemWidget(text: 'Order',),
         const  ListItemWidget(text: 'History',),
         const  ListItemWidget(text: 'Edit Profile',),
         const  SizedBox(height: 20,),
         GestureDetector(onTap: ()async{
           await FirebaseAuth.instance.signOut();
           Navigator.of(context).pushReplacementNamed("LoginView");

         },child: const  ListItemWidget2(text: 'Log out',)),
          SizedBox(height: SizeConfig.defaultSize!*3,),

        ],
      ),
    );
  }
}
