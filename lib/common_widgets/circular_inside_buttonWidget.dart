import 'package:flutter/material.dart';

class CircularInsideButtonWidget extends StatelessWidget {
  const CircularInsideButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 4,
                )),
          ),
          SizedBox(width: 30,),
          Text("Please wait",style: TextStyle(
            color: Colors.blue,
          ),),
        ],),
    );
  }
}