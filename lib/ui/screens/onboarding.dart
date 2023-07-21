import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';

import '../routes/routes.dart';
import '../widgets/gap.dart';

class OnboardingPages extends StatefulWidget{
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OnboardingPagesState();
  
}

class OnboardingPagesState extends State<OnboardingPages>{

  late ElevatedButton materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Gap(size: 200,),
              Center(
                child: SvgPicture.asset('assets/images/onboarding 1.svg'),
              ),
              Gap(size: 72,),
              Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'onboarding_text_1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Gap(size: 150,),
              Center(
                child: SvgPicture.asset('assets/images/onboarding 2.svg')
              ),
             Gap(size: 65,),
             Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'onboarding_text_2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),

            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Gap(size: 150,),
              Center(
                child: SvgPicture.asset('assets/images/onboarding 3.svg')
              ),
              Gap(size: 65,),
              Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'onboarding_text_3',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  ElevatedButton _skipButton({void Function(int)? setIndex}) {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(69, 50))
        ),
        onPressed: (){
          if (setIndex != null) {
            index = index+1;
            setIndex(index);
          }
        },
        child: Text(
          'next',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white
          ),
        ).tr()
    );
  }

  ElevatedButton get _signinButton {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(69, 50))
      ),
        onPressed: (){
          Navigator.pushReplacementNamed(context, Routes.login);
        },
        child: Text(
          'finish',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white
          ),
        ).tr()
    );
  }
    InkWell _previousButton({void Function(int)? setIndex}) {
    return InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = index-1;
            setIndex(index);
          }
        },
        child:  Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'previous',
            style: TextStyle(
              fontSize: 10,
              color: Colors.deepPurple
            ),
          ).tr(),
        ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0.0,
                color: Colors.white,
              ),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Flexible(child: _previousButton(setIndex: setIndex)),
                    Expanded(
                        child: CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                    indicator: Indicator(
                      closedIndicator: ClosedIndicator(
                        color: Colors.deepPurple
                      ),
                      // activeIndicator: ActiveIndicator(
                      //   color: Colors.deepPurple,
                      // ),
                      indicatorDesign: IndicatorDesign.polygon(
                        polygonDesign: PolygonDesign(
                          polygon: DesignType.polygon_circle,
                          ),
                        ),
                      ),
                    )),
                    index == pagesLength - 1
                        ? _signinButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}