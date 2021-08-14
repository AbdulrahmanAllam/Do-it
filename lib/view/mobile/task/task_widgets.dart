import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidgets{
  Widget _uncheckedTask(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.circle, size: 17,color: Colors.amber,),
          SizedBox(width: 10,),
          Text("Task"),
          Expanded(child: SizedBox()),
          Icon(Icons.close, size: 17,),
        ],
      ),
    );
  }

  Widget _checkedTask(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.check_circle_rounded, size: 17,color: Colors.green,),
          SizedBox(width: 10,),
          Text("Task"),
          Expanded(child: SizedBox()),
          Icon(Icons.close, size: 17,),
        ],
      ),
    );
  }

  Widget task(int i){
    if(i.isEven){
      return _checkedTask();
    }else{
      return _uncheckedTask();
    }
  }
}