import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MesurePageItemWidget extends StatelessWidget {
  bool isFirst,isLast;
  String title,dose,hour;
  MesurePageItemWidget({Key? key,required this.isFirst,required this.isLast,required this.title,required this.dose,required this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60,
              padding: EdgeInsets.all(8.0),
              child: Text('20:10'),
            ),
            Container(
              width: 50,
              child: TimelineTile(
                isFirst: isFirst,
                isLast: isLast,
                hasIndicator: true,
                indicatorStyle: IndicatorStyle(color: Colors.blueAccent),
                alignment: TimelineAlign.center,

              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${title.toLowerCase()}'),
                  SizedBox(width: 8,),
                  Text('$dose')
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:Border.all(
                      color: Colors.grey,
                      width: 0.5
                  )
              ),
            )
          ],
        ));
  }
}
