import 'package:dark_mode_app/src/models/book.dart';
import 'package:dark_mode_app/src/pages/home/detail/detail.dart';
import 'package:dark_mode_app/src/pages/home/widget/category_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RecommendedBook extends StatelessWidget {
  final recommendedList = Book.generateRecommendedBook();
   RecommendedBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoryTitle(
            title: 'Recommended for you',
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
                      Get.to(DetailScreen(recommendedList[index]));
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(recommendedList[index].imgUrl),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2 ,),
                                child: Text(recommendedList[index].name , overflow: TextOverflow.ellipsis,),
                              ),
                              Text(
                                recommendedList[index].author,
                                 style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left:10,
                          child: _buildIconText(
                            Icons.star,
                            '${recommendedList[index].score}',
                            Colors.orange[300]!
                          ),
                        )

                      ],
                    ),
                  );
                },
                separatorBuilder: (_ , index) =>  SizedBox(width: 15,),
                itemCount: recommendedList.length
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildIconText (IconData icon , String text , Color color){
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black87,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
            color: color,
          ),
          SizedBox(width: 5,),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300]!
            ),
          )
        ],
      ),
    );
  }
}
