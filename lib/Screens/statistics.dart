// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:managment/data/utlity.dart';
// import 'package:managment/widgets/chart.dart';
//
// import '../data/model/add_date.dart';
// import '../data/top.dart';
//
// class Statistics extends StatefulWidget {
//   const Statistics({Key? key}) : super(key: key);
//
//   @override
//   State<Statistics> createState() => _StatisticsState();
// }
//
// ValueNotifier kj = ValueNotifier(0);
//
// class _StatisticsState extends State<Statistics> {
//   List day = ['Day', 'Week', 'Month', 'Year'];
//   List f = [today(), week(), month(), year()];
//   List<Add_data> a = [];
//   int index_color = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ValueListenableBuilder(
//           valueListenable: kj,
//           builder: (BuildContext context, dynamic value, Widget? child) {
//             a = f[value];
//             return custom();
//           },
//         ),
//       ),
//     );
//   }
//
//   CustomScrollView custom() {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Statistics',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ...List.generate(
//                       4,
//                       (index) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               index_color = index;
//                               kj.value = index;
//                             });
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: index_color == index
//                                   ? Color.fromARGB(255, 47, 125, 121)
//                                   : Colors.white,
//                             ),
//                             alignment: Alignment.center,
//                             child: Text(
//                               day[index],
//                               style: TextStyle(
//                                 color: index_color == index
//                                     ? Colors.white
//                                     : Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Chart(
//                 indexx: index_color,
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Top Spending',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Icon(
//                       Icons.swap_vert,
//                       size: 25,
//                       color: Colors.grey,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SliverList(
//             delegate: SliverChildBuilderDelegate(
//           (context, index) {
//             return ListTile(
//               leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(5),
//                 child: Image.asset('images/${a[index].name}.png', height: 40),
//               ),
//               title: Text(
//                 a[index].name,
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               subtitle: Text(
//                 ' ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               trailing: Text(
//                 a[index].amount,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 19,
//                   color: a[index].IN == 'Income' ? Colors.green : Colors.red,
//                 ),
//               ),
//             );
//           },
//           childCount: a.length,
//         ))
//       ],
//     );
//   }
// }
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:managment/widgets/chart.dart';
// //
// // class Statistics extends StatefulWidget {
// //   const Statistics({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Statistics> createState() => _StatisticsState();
// // }
// //
// // class _StatisticsState extends State<Statistics> {
// //   List day = ['Day', 'Week', 'Month', 'Year'];
// //   int index_color = 0;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:SafeArea(
// //         child:CustomScrollView(
// //           slivers: [
// //             SliverToBoxAdapter(
// //                 child:Column(
// //                 children: [
// //                   SizedBox(height: 20,),
// //                   Text(
// //                     'Statistics',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w700,
// //
// //                     ),
// //                   ),
// //                   SizedBox(height: 20,),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 15),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         ...List.generate(4, (index){
// //                           return GestureDetector(
// //                             onTap:(){
// //                               setState(() {
// //                                 index_color =index;
// //                               });
// //                             },
// //                             child: Container(height: 40,
// //                               width: 80,
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 color: index_color==index ?Color.fromARGB(255, 47, 125, 121):Colors.white,
// //
// //                               ),
// //                               alignment: Alignment.center,
// //                               child: Text(
// //                                 day[index],
// //                                 style: TextStyle(
// //                                   color: index_color==index ?Colors.white:Colors.black,
// //                                   fontSize: 16,
// //                                   fontWeight: FontWeight.w500,
// //
// //                                 ),
// //                               ),
// //                             ),
// //                           );
// //                         })
// //                       ],
// //                     ),
// //                   ),
// //                   SizedBox(height: 20,),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 15),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: [
// //                         Container(
// //                           width: 120,
// //                           height: 40,
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                             children: [
// //                               Text('Expanse',
// //                               style: TextStyle(
// //                                 color: Colors.grey,
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                               ),
// //                               Icon(Icons.arrow_downward_sharp,color: Colors.grey,)
// //                             ],
// //                           ),
// //                           decoration: BoxDecoration(
// //                             border: Border.all(
// //                               color: Colors.grey,
// //                               width: 2,
// //
// //                             ),
// //                             borderRadius: BorderRadius.circular(8)
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                   SizedBox(height: 20,),
// //
// //                   Chart(),
// //
// //                   SizedBox(height: 20,),
// //
// //
// //
// //
// //
// //                 ],
// //                 )
// //             )
// //           ],
// //
// //         )
// //       )
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:managment/data/utlity.dart';
// // import 'package:managment/widgets/chart.dart';
// //
// // import '../data/model/add_date.dart';
// // import '../data/top.dart';
// //
// // class Statistics extends StatefulWidget {
// //   const Statistics({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Statistics> createState() => _StatisticsState();
// // }
// //
// // ValueNotifier kj = ValueNotifier(0);
// //
// // class _StatisticsState extends State<Statistics> {
// //   List day = ['Day', 'Week', 'Month', 'Year'];
// //   List f = [today(), week(), month(), year()];
// //   List<Add_data> a = [];
// //   int index_color = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: ValueListenableBuilder(
// //           valueListenable: kj,
// //           builder: (BuildContext context, dynamic value, Widget? child) {
// //             a = f[value];
// //             return custom();
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// //   CustomScrollView custom() {
// //     return CustomScrollView(
// //       slivers: [
// //         SliverToBoxAdapter(
// //           child: Column(
// //             children: [
// //               SizedBox(height: 20),
// //               Text(
// //                 'Statistics',
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w700,
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 15),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     ...List.generate(
// //                       4,
// //                           (index) {
// //                         return GestureDetector(
// //                           onTap: () {
// //                             setState(() {
// //                               index_color = index;
// //                               kj.value = index;
// //                             });
// //                           },
// //                           child: Container(
// //                             height: 40,
// //                             width: 80,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10),
// //                               color: index_color == index
// //                                   ? Color.fromARGB(255, 47, 125, 121)
// //                                   : Colors.white,
// //                             ),
// //                             alignment: Alignment.center,
// //                             child: Text(
// //                               day[index],
// //                               style: TextStyle(
// //                                 color: index_color == index
// //                                     ? Colors.white
// //                                     : Colors.black,
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.w500,
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //
// //               Chart(),
// //
// //               SizedBox(height: 20),
// //
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 15),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Top Spending',
// //                       style: TextStyle(
// //                           color: Colors.black,
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold),
// //                     ),
// //                     Icon(
// //                       Icons.swap_vert,
// //                       size: 25,
// //                       color: Colors.grey,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         SliverList(
// //             delegate: SliverChildBuilderDelegate(
// //                   (context, index) {
// //                 return ListTile(
// //                   leading: ClipRRect(
// //                     borderRadius: BorderRadius.circular(5),
// //                     child: Image.asset('images/${a[index].name}.png', height: 40),
// //                   ),
// //                   title: Text(
// //                     a[index].name,
// //                     style: TextStyle(
// //                       fontSize: 17,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                   subtitle: Text(
// //                     ' ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                   trailing: Text(
// //                     a[index].amount,
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.w600,
// //                       fontSize: 19,
// //                       color: a[index].IN == 'Income' ? Colors.green : Colors.red,
// //                     ),
// //                   ),
// //                 );
// //               },
// //               childCount: a.length,
// //             ))
// //       ],
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/data/utlity.dart';
import 'package:managment/widgets/chart.dart';

import '../data/model/add_date.dart';
import '../data/top.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int index_color = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            a = f[value];
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      4,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              index_color = index;
                              kj.value = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index_color == index
                                  ? Colors.deepOrangeAccent
                                  : Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              day[index],
                              style: TextStyle(
                                color: index_color == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Chart(
                indexx: index_color,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset('assets/images/${a[index].name}.png', height: 40),
                  ),
                  title: Text(
                    a[index].name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    ' ${a[index].datetime.day}-${a[index].datetime.month}-${a[index].datetime.year}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    a[index].amount,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: a[index].IN == 'Income' ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
              childCount: a.length,
            ))
      ],
    );
  }
}