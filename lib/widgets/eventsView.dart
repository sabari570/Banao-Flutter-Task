import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  final String imgPath;
  final String imgTitle;
  final String imgDesc;
  final String lessons;
  final bool showBook;
  const EventsView(
      {Key? key,
      required this.imgPath,
      required this.imgTitle,
      required this.imgDesc,
      required this.lessons,
      required this.showBook})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        child: Container(
          height: 280,
          width: 242,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imgPath,
                height: 140,
                width: 242,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imgTitle,
                      style: TextStyle(
                        color: Color(0xFF598BED),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      imgDesc,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${lessons} min",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        showBook
                            ? Container(
                                width: 62,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xFF598BED), width: 2)),
                                child: Text(
                                  "Book",
                                  style: TextStyle(
                                      color: Color(0xFF598BED),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ))
                            : Container(
                                width: 62,
                                height: 26,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 18,
                                ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
