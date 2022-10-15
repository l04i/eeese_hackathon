import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VirtualTicket extends StatelessWidget {
  const VirtualTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIcon(
                  iconColor: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icons.arrow_back_ios),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: Dimensions.eventImgHeight / 1.2,
                width: Dimensions.screenWidth - Dimensions.height30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/athlete.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Athletes Of The Year",
                  style: MyTextStyle().bigText(Colors.black).copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Date",
                        style:
                            MyTextStyle().mediumText(AppColors.lightgreyColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "November,21,2022",
                        style: MyTextStyle()
                            .bigText(Colors.black)
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Time",
                        style:
                            MyTextStyle().mediumText(AppColors.lightgreyColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "8:00 PM",
                        style: MyTextStyle()
                            .bigText(Colors.black)
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Place",
                style: MyTextStyle().mediumText(AppColors.lightgreyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Western Football Field",
                style:
                    MyTextStyle().bigText(Colors.black).copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Center(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Example_barcode.svg/1200px-Example_barcode.svg.png"),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
