import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone_app/details.dart';
import 'package:netflix_clone_app/functions/functions.dart';

class ShowListModel extends StatefulWidget {
  final String name;
  final int index;
  const ShowListModel({Key? key,required this.name,required this.index}) : super(key: key);

  @override
  State<ShowListModel> createState() => _ShowListModelState();
}

class _ShowListModelState extends State<ShowListModel> {
  double? fontsize;
  @override
  void initState() {
    if(widget.name == ''){
      fontsize=0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: fontsize??20.w, top: fontsize??20.h),
          child: Text(widget.name,style: TextStyle(
            color: Colors.white,
            fontSize: fontsize ?? 30.sp,
            fontWeight: FontWeight.w800
            )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.h, right: 0.h, bottom: 20.h, top: fontsize??20.h),
          child: SizedBox(
            height: 200.h,
            child:FutureBuilder(
              future: Functions.returncontroller(widget.index+1),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.data==null){
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 7,
                  ),
                );
              }
              return  ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                String name=snapshot.data[index]['title'] ?? snapshot.data[index]['original_name'];
                return Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details(item: snapshot.data[index], name: name ))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 170.h,
                            width: 150.w,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500${snapshot.data[index]['poster_path']}')),
                              )
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 120.w,
                            child: Text(snapshot.data[index]['title'] !=null ? '${snapshot.data[index]['title']}' :'${snapshot.data[index]['original_name']}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize:15.sp
                              )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                );
              },
            );
           },
           ),
          ),
        ),
      ],
    );
  }
}