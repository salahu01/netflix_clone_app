import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone_app/customs/show_list_modal.dart';

import 'functions/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            actions: [
              const Spacer(),
              Image.asset('lib/assets/Netflix-logo-on-transparent-background-PNG.png',
              width: 33.w,
              height:33.w,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text('TV Shows',
                style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
                ),
                ),
              ),
              const Spacer(flex: 2),
              Align(
                alignment: Alignment.center,
                child: Text('Movies',
                style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
                ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text('My List',
                style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
                ),
                ),
              ),
              const Spacer(flex: 2)
            ],
            expandedHeight: 550.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add,color: Colors.white,size: 17.sp),
                    SizedBox(height: 3.h),
                     Text('My List',
                      style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 6.sp
                      ))
                  ],
                ),
                  SizedBox(
                  width: 65.w,
                  height: 28.h,
                  child: TextButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.white)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.play_arrow,color: Colors.black,size: 13.sp,),
                      Text('Play',
                      style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 10.sp
                      )),
                    ],
                  ) 
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline,color: Colors.white,size: 17.sp),
                    SizedBox(height: 3.h),
                     Text('Play',
                      style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 6.sp
                      ))
                  ],
                ),
                ],
                ),
              ),
              background: FutureBuilder(
                future: Functions.returncontroller(3),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.data==null){
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 7,
                        color: Colors.white,
                      ),
                    );
                  }
                  return Image.network('https://image.tmdb.org/t/p/w500${snapshot.data[0]['poster_path']}',
                  fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 4,
              (BuildContext context, int index) {
                return ShowListModel(name: listnames[index],index:index);
              },
            ),
          ),
        ],
      ));
  }
  List<String>listnames=['Trending Movies','Popular Movies','Popular Shows','Top Rated Shows',];
}