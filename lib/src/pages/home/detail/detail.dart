import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dark_mode_app/src/models/book.dart';
import 'package:get/get.dart';



class DetailScreen extends StatelessWidget {
  final Book  book;
   DetailScreen(this.book,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 550,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    child: Image.asset(book.imgUrl , fit: BoxFit.fitWidth,),
                  ),
                  Positioned(
                    top: 56,
                    left: 20,
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[900]!,
                          shape: BoxShape.circle
                        ),
                        child:const Icon(Icons.arrow_back , color: Colors.white , size: 20,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    book.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      height: 1.2,
                    ),
                  ),
                ),
                const  SizedBox(height: 15,),
                Text(
                  book.author,
                  style:const TextStyle(
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconText(
                        Icons.star,
                        '${book.score}(${book.review}K)',
                        Colors.orange[300]!
                    ),
                    const SizedBox(width: 10,),
                    _buildIconText(
                        Icons.visibility,
                        '${book.view}M Read',
                        Theme.of(context).colorScheme.onSurface
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: book.type!.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      label: Text(e),
                    ),
                  )
                  ).toList(),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    book.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: true,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        Icons.add,
                        'Add To Library',
                        Colors.grey[800]!,
                          (){}
                      ),
                      const SizedBox(width: 15,),
                      _buildButton(
                          Icons.menu_book,
                          'Read Now',
                          Color(0xff6741ff),
                              (){}
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildButton (IconData icon , String text , Color color , GestureTapCallback onPressed ){
    return SizedBox(
      height: 40,
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 5,),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
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
