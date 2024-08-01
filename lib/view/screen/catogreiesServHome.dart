
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homeCatogireyControllerImp.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listServesHome.dart';
import '../widget/home/listcateogoriesSerHome.dart';
class HomeCategoriers extends StatelessWidget{
  const HomeCategoriers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeCategoriesControllerImpelment());
    return GetBuilder<HomeCategoriesControllerImpelment>(
      builder: (controller) =>  Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(
              children: [
                 CustomAppBar(
                      mycontroller: null,
                      titleappbar: "Find Catogrey Book",
                      // onPressedIcon: () {},
                      onPressedSearch: () {
                       // controller.onSearchItems();
                      },
                      onChanged: (val) {
                       // controller.checkSearch(val);
                      },
                      onPressedIconFavorite: () {
                        Get.toNamed(AppRoute.myfavroite);
                      },
                    ),
                CustomTitleHome(
                  title: "49".tr,
                ),
                const ListServesHome(),
                // // ListCategoriesHome(),
                CustomTitleHome(
                  title: "48".tr,
                ),
               const ListcateogoriesSerHome(),
    
              ],
            ),
          ),
        
      ),
    );
  }
}
