import 'package:flutter/material.dart';

class LessonsViewAllScreen extends StatelessWidget {
  final lessonItems;
  final lessonsCount;
  const LessonsViewAllScreen({Key? key, this.lessonItems, this.lessonsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF3FD),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lessons for you",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 117, 115, 115),
          ),
        ),
        actions: [
          Image.asset("assets/forum_black_24dp 1.png"),
          Image.asset("assets/Notification.png")
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: lessonsCount ?? 0,
                    itemBuilder: ((context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          child: SizedBox(
                            height: 350,
                            width: 242,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/programsAssets/${lessonItems[index].category}.jpg',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lessonItems[index].category ??
                                            'Babycare',
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
                                        lessonItems[index].name ??
                                            'Understanding of human behaviour',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${lessonItems[index].duration.toString()} min",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Container(
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
                    })),
              ),
              const SizedBox(
                height: 114,
              )
            ],
          ),
        ),
      ),
    );
  }
}
