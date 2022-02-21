import 'package:dark_mode_app/src/models/book.dart';
import 'package:dark_mode_app/src/pages/home/detail/detail.dart';
import 'package:dark_mode_app/src/pages/home/widget/category_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TrendingBook extends StatelessWidget {
  final trendingBookList = Book.generateTrendingBooks();
   TrendingBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CategoryTitle(title: "Trending Book",),
        ListView.separated(
          padding: const EdgeInsets.all(30),
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: trendingBookList.length,
          separatorBuilder: (_ , index) => SizedBox(height: 10,),
          itemBuilder: (context , index) {
            return InkWell(
              onTap: (){
                Get.to(DetailScreen(trendingBookList[index]));
              },
              child: SizedBox(
                height: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(trendingBookList[index].imgUrl) ,
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                   trendingBookList[index].name,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),

                                  ),
                                ),
                                Icon(Icons.bookmark , color: Colors.orange[300],)
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                trendingBookList[index].author ,
                                style: TextStyle(color: Colors.grey),)),

                            SizedBox(height: 15,),
                            Text(
                              trendingBookList[index].desc,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                _buildIconText(
                                    Icons.star,
                                    '${trendingBookList[index].score}(${trendingBookList[index].review}K)',
                                    Colors.orange[300]!
                                ),
                                const SizedBox(width: 10,),
                                _buildIconText(
                                    Icons.visibility,
                                    '${trendingBookList[index].view}M Read',
                                    Theme.of(context).colorScheme.onSurface
                                ),
                              ],
                            )
                          ],
                        )),

                  ],


                ),
              ),
            );
          },


        ),
      ],
    );
  }
  Widget _buildIconText (IconData icon , String text , Color color){
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        const SizedBox(width: 5,),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
