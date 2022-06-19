import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone_app/customs/show_list_modal.dart';

class Details extends StatelessWidget {
  const Details({Key? key ,required this.item,required this.name}) : super(key: key);
  final dynamic item;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Image.asset('lib/assets/logo.png',
          width: 100.w,
          ),
        ),
        actions: [
          Image.asset('lib/assets/profile.jpg',
          width: 40.w,
          height: 40.w,
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://image.tmdb.org/t/p/w500${item['backdrop_path']}',
            width: double.maxFinite,
            height: 250.h,
            fit: BoxFit.cover,
            ),
            SizedBox(height: 10.h),
            Text(name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 30.sp
            ),
            ),
            SizedBox(height: 10.h),
            Text('⭐ Average Rating - ${item['vote_average']}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 14.sp
            ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text('Release on : ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp
                ),
                ),
                Text('${item['release_date']}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp
                ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Image.network('https://image.tmdb.org/t/p/w500${item['poster_path']}',
                height: 160.h,
                width: 120.w,
                ),
                Flexible(
                  child: Text('${item['overview']}',
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                   fontSize: 15.sp
                  ),
                   ),
                ),
              ],
            ),
          ShowListModel(name: 'Related Contents', index: 0),
          ShowListModel(name: '', index: 1),
          ShowListModel(name: '', index: 2),
          ShowListModel(name: '', index: 3),        
          ],
        ),
      ),
    );
  }
}