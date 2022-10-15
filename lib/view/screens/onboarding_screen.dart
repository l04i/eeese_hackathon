import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: Dimensions.bottomSheetHeight),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: const [
            OnboardingPage(
                image: "assets/images/onboarding1.png",
                text:
                    "Discover upcoming events and select the one you like with one click",
                textColor: Colors.black,
                color: AppColors.greyColor),
            OnboardingPage(
                image: 'assets/images/onboarding2.png',
                text:
                    "All the necessary informations about tickets and timetable",
                textColor: Colors.black,
                color: AppColors.greyColor),
            OnboardingPage(
                image: "assets/images/onboarding3.png",
                text: "Share events and lectures with your colleagues",
                textColor: Colors.black,
                color: AppColors.greyColor),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? GestureDetector(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool("showHome", true);
                Get.offNamed("/login");
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.height30,
                    vertical: Dimensions.height15),
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height30),
                height: Dimensions.loginContainerHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(Dimensions.height15),
                ),
                child: Center(
                  child: Text(
                    "Get Started ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.font16 * 1.4,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height30),
              height: Dimensions.bottomSheetHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: Dimensions.font16 * 1.2,
                            fontWeight: FontWeight.bold),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: SwapEffect(
                          spacing: Dimensions.height15,
                          dotColor: AppColors.greyColor,
                          activeDotColor: Colors.deepOrangeAccent,
                        ),
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: Dimensions.font16 * 1.2,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {Key? key,
      required this.image,
      required this.text,
      required this.textColor,
      required this.color})
      : super(key: key);
  final String image;
  final String text;
  final Color textColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Dimensions.loginContainer / 1.3,
            width: Dimensions.loginContainer / 1.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: Dimensions.height15 * 1.5,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Dimensions.font16 * 1.8,
                  color: textColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
