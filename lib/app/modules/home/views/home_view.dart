import 'package:blue_chat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Obx(()=> Text(controller.name.value)),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: ()=> Get.toNamed(Routes.devices),
            child: Row(
              children: const [
                Icon(FeatherIcons.list, size: 16,),
                SizedBox(width: 4,),
                Text('Dispositivos')
              ],
            ),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      body: Container(),
    );
  }
}
