import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Components
import '../components/textstyles.dart';
import '../components/reusable.dart';
import '../components/options.dart';

Color globalColor;
var reviewsref;

class ReviewPage extends StatefulWidget {
  final Color color;
  final String code;
  final String docref;
  final String collectionName;

  ReviewPage({Key key, this.color, this.code, this.docref, this.collectionName})
      : super(key: key) {
    globalColor = this.color;
    reviewsref = Firestore.instance
        .collection(collectionName)
        .document(docref)
        .collection("reviews");
  }

  getColor() {
    return this.color;
  }

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double reviewValue = 2.5;
  TextEditingController reviewText = TextEditingController();

  addReview() async {
    if (multichip.selectedChoices.isEmpty) {
      print("No choices");
      return;
    }
    var data = {
      "options": multichip.selectedChoices,
      "value": reviewValue,
      "text": reviewText.text,
      // "timestamp": FieldValueType.serverTimestamp,
    };

    await reviewsref.add(data);

    reviewValue = 2.5;
    multichip.selectedChoices = [];
    reviewText.clear();
    Navigator.pop(context);
    // Firestore.instance.collection("path").document("d").updateData(data)
  }

  static MultiSelectChip multichip = MultiSelectChip(
    options: [
      "Clear",
      "Simple",
      "Tough Grading",
      "Hysterical",
      "Interesting",
      "Test Heavy",
      "Easy A",
      "Amazing Lecturer",
      "Group Work",
      "Participation",
    ],
    color: globalColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: customAppBar(context, title: widget.code, color: widget.color),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: Container(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Leave a review, ",
                    textAlign: TextAlign.left,
                    style: paragraphHeadingStyle(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Select a few options",
                    style: reviewParagraphStyle(),
                  ),
                  multichip,
                  SizedBox(height: 25),
                  Text(
                    "Rate it out of 5?",
                    style: reviewParagraphStyle(),
                  ),
                  SizedBox(height: 5),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: globalColor,
                      inactiveTrackColor: globalColor.withOpacity(0.15),
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      thumbColor: globalColor,
                      overlayColor: globalColor.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: globalColor,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: reviewValue,
                      label: '$reviewValue',
                      onChanged: (value) {
                        setState(() {
                          reviewValue = value;
                          //print(value);
                        });
                      },
                      min: 0,
                      max: 5,
                      divisions: 10,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: reviewText,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    // textInputAction: TextInputAction.continueAction,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText:
                          "Here is your chance to talk about your experience.... ",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globalColor),
                      ),
                      enabled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: globalColor),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,
                      child: RaisedButton(
                        color: globalColor.withAlpha(251),
                        elevation: 4,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: () {
                          addReview();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
