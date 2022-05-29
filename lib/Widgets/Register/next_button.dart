import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Providers/register_widgets.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
          height: ScreenSize.height! * 0.12,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton.large(
                  child: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    
                    Provider.of<RegisterWidgets>(context, listen: false)
                        .onClick(context);
                  }),
            ),
          )),
    );
  }
}