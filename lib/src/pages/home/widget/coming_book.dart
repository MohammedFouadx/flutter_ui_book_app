import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ComingBook extends StatelessWidget {
  final  upComings = [
    'assets/images/images.jpg',
    'assets/images/upcoming2.png',
    'assets/images/upcoming3.png'
  ];
  final _pageController = PageController();
   ComingBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20 , vertical:  10),
      height: 120,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: upComings.map((e) =>  Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(e , fit: BoxFit.cover,),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black,
                        Colors.black45,
                        Colors.black12,
                        Colors.black.withOpacity(0)
                      ]
                    )
                  ),
                )
              ],
            )
            ).toList(),
          ),
          Positioned(
            left: 30,
            bottom: 10,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: upComings.length,
              onDotClicked: (index){
                _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut
                );
              },
              effect: const ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                spacing: 6,
                expansionFactor: 4,
                activeDotColor: Colors.white,

              ),

            ),
          )
        ],
      ),
    );
  }
}
