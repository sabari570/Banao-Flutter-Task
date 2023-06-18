import 'package:banao_flutter_tasks/screens/lessonsViewAllScreen.dart';
import 'package:banao_flutter_tasks/screens/programsViewAllScreen.dart';
import 'package:banao_flutter_tasks/services/integratingAPI.dart';
import 'package:banao_flutter_tasks/widgets/customWidget.dart';
import 'package:banao_flutter_tasks/widgets/eventsView.dart';
import 'package:banao_flutter_tasks/widgets/programsView.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 1);
  int selectedIndex = 0;
  var programsDataResult;
  var items;
  var programsCount;
  var lessonsDataResult;
  var lessonItems;
  var lessonsCount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProgramsInfo();
    fetchLessonsInfo();
  }

  void fetchProgramsInfo() async {
    programsDataResult = await fetchProgramsData();
    print("Name: ${programsDataResult.items[0].name}");
    print("Count: ${programsDataResult.count}");
    setState(() {
      programsCount = programsDataResult.count;
      items = programsDataResult.items;
    });
  }

  void fetchLessonsInfo() async {
    lessonsDataResult = await fetchLessonsData();
    print("Lesson name: ${lessonsDataResult.items[0].name}");
    print("Count: ${lessonsDataResult.count}");
    setState(() {
      lessonsCount = lessonsDataResult.count;
      lessonItems = lessonsDataResult.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    List icons = [
      'assets/Book-mark.png',
      'assets/help-circle.png',
      'assets/Book-open_color.png',
      'assets/trello.png'
    ];
    List iconTitle = ['Programs', 'Get help', 'Learn', 'DD Tracker'];
    List programViewsImgPath = [
      'assets/Frame 122.png',
      'assets/4956845 1.png',
    ];
    List programViewsTitle = ['Lifestyle', 'Working Parents'];
    List programViewsDesc = [
      'A Complete guide for you new born baby',
      'Understanding of human behaviour'
    ];
    List programViewsLessons = ['16 lessons', '12 lessons'];
    return Scaffold(
      backgroundColor: const Color(0xFFEEF3FD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Menu.png")))),
        actions: [
          Image.asset("assets/forum_black_24dp 1.png"),
          Image.asset("assets/Notification.png")
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hello, Priya!",
                style: TextStyle(
                    fontFamily: "Lora",
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "What do you wanna learn today?",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    mainAxisSpacing: 10.0, // Spacing between rows
                    crossAxisSpacing: 20.0, // Spacing between columns
                    childAspectRatio:
                        4, // Aspect ratio of each grid item (width / height)
                  ),
                  itemCount: 4, // Total number of grid items
                  itemBuilder: (BuildContext context, int index) {
                    return CustomWidget(
                      iconPath: icons[index],
                      title: iconTitle[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print("View All Pressed");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PorgramsViewAllScreen(
                      programsCount: programsCount,
                      items: items,
                    );
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Programs for you",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: programsCount ?? 0,
                    itemBuilder: ((context, index) {
                      return ProgramsView(
                          imgPath:
                              'assets/programsAssets/${items[index].category}.jpg',
                          imgTitle: items[index].category ?? 'LifeStyle',
                          imgDesc: items[index].name ??
                              'A complete guide for your new born baby',
                          lessons: items[index].lesson.toString());
                    })),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Events and experinces",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: ((context, index) {
                      return const EventsView(
                        imgPath:
                            'assets/young-woman-doing-natarajasana-exercise 1.png',
                        imgTitle: 'Babycare',
                        imgDesc: 'Understanding of human behaviour',
                        lessons: '13 Feb, Sunday',
                        showBook: true,
                      );
                    })),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Lessons for you",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LessonsViewAllScreen(
                          lessonItems: lessonItems,
                          lessonsCount: lessonsCount,
                        );
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lessonsCount ?? 0,
                    itemBuilder: ((context, index) {
                      return EventsView(
                        imgPath:
                            'assets/programsAssets/${lessonItems[index].category}.jpg',
                        imgTitle: lessonItems[index].category ?? 'Babycare',
                        imgDesc: lessonItems[index].name ??
                            'Understanding of human behaviour',
                        lessons: lessonItems[index].duration.toString(),
                        showBook: false,
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFF598BED),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Color.fromARGB(255, 105, 102, 102),
        ),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Book-open.png"),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Layout.png"),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Comment.png"),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Profile.png"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
