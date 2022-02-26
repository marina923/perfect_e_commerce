import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
   final String url;
   final String name;
    final String price;
    final String category;
   CustomCard({
      required this.url,required this.name,required this.price,required this.category,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      height: 200.h,
      child: Card(
         elevation: 20,
        color:Colors.white,
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(url),
              height: 220.h,
              width:340.w,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(name),
                  Spacer(),

                  Text(price),

                ],
              ),
            ),
            Text('فئه:$category'),
          ],
        ),
      ),
    );
  }
}
