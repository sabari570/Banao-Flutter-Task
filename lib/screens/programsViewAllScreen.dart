// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banao_flutter_tasks/widgets/programsView.dart';
import 'package:flutter/material.dart';

class PorgramsViewAllScreen extends StatelessWidget {
  final programsCount;
  final items;
  const PorgramsViewAllScreen({
    Key? key,
    required this.programsCount,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF3FD),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Programs for you",
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
                    itemCount: programsCount ?? 0,
                    itemBuilder: ((context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          child: SizedBox(
                            height: 300,
                            width: 242,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/programsAssets/${items[index].category}.jpg',
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
                                        items[index].category ?? 'LifeStyle',
                                        style: const TextStyle(
                                          color: Color(0xFF598BED),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        items[index].name ??
                                            'A complete guide for your new born baby',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${items[index].lesson.toString()} lessons',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
