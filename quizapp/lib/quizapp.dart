import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class SingleQuestionIndex {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionIndex({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State<QuizApp> {
  List allQuestions = [
    const SingleQuestionIndex(
      question: "Who developed flutter?",
      options: ["Apple", "Microsoft", "Google", "Facebook"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "What are Flutter's UI components?",
      options: ["Widgets", "Elements", "Blocks", "Modules"],
      answerIndex: 0,
    ),
    const SingleQuestionIndex(
      question: "Language used in Flutter?",
      options: ["Java", "Dart", "Python", "Swift"],
      answerIndex: 1,
    ),
    const SingleQuestionIndex(
      question: "Which IDE is  used for Flutter ?",
      options: ["Anaconda", "PyCharm", "Xcode", "VScode"],
      answerIndex: 3,
    ),
    const SingleQuestionIndex(
      question: "What is package manager called?",
      options: ["DartHub", "Pub", "Dart", "FlutterHub"],
      answerIndex: 1,
    ),
  ];

  bool questionScreen1 = true;
  bool questionScreen2 = false;
  int questionIndex = 0;
  int optionIndex = -1;
  int correctAns = 0;

  MaterialStateProperty<Color> getColor(int buttonNo) {
    if (optionIndex != -1) {
      if (buttonNo == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonNo == optionIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 129, 2, 214));
      }
    } else {
      return const MaterialStatePropertyAll(Color.fromARGB(255, 129, 2, 214));
    }
  }

  void validateNextPage() {
    if (optionIndex == allQuestions[questionIndex].answerIndex) {
      correctAns++;
    }

    if (optionIndex != -1) {
      if (questionIndex < allQuestions.length) {
        questionIndex++;
      }
    }
    optionIndex = -1;

    if (questionIndex == allQuestions.length) {
      questionScreen1 = false;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen1 == true && questionScreen2 == false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            side: BorderSide(width: 2, color: Colors.black),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(25), child: SizedBox()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 240, 122, 226),
                  Color.fromARGB(255, 129, 2, 214),
                  Color.fromARGB(255, 129, 2, 214),
                ],
                transform: GradientRotation(900),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.network(
                "https://thumbs.dreamstime.com/b/quiz-time-banner-design-template-quiz-time-banner-design-template-game-poster-invitation-play-trivia-games-235648367.jpg",
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionScreen2 = true;
                  });
                },
                style: ButtonStyle(
                  side: const MaterialStatePropertyAll(
                      BorderSide(width: 1, color: Colors.black87)),
                  backgroundColor: getColor(0),
                  fixedSize: const MaterialStatePropertyAll(Size(200, 40)),
                ),
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 40,
          color: Color.fromARGB(255, 129, 2, 214),
          child: SizedBox(
            height: 30,
            child: Center(
              child: Text(
                'Developed By Laxmi',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    } else if (questionScreen1 == true && questionScreen2 == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 254, 251, 254),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 129, 2, 214),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question :",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                "   ${allQuestions[questionIndex].question}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //----------------------------------Button1----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 0;
                  });
                }
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: getColor(0),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "A. ${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //----------------------------------Button2----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 1;
                  });
                }
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: getColor(1),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "B. ${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //----------------------------------Button3----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 2;
                  });
                }
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: getColor(2),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "C. ${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //----------------------------------Button4----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 3;
                  });
                }
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: getColor(3),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "D. ${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateNextPage();
            });
          },
          backgroundColor: Color.fromARGB(255, 129, 2, 214),
          child: const Icon(
            Icons.forward,
            color: Color.fromARGB(255, 239, 238, 239),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 248, 245, 249),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 129, 2, 214),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                "https://t3.ftcdn.net/jpg/03/42/15/76/360_F_342157634_d5c4lkk15wqxNRY8s8L1GKYsYFbXTm2x.jpg",
                height: 500,
                width: 500,
              ),
              const Text(
                "Your Score Is",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "$correctAns / ${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 129, 2, 214),
          onPressed: () {
            setState(() {
              questionIndex = 0;
              optionIndex = -1;
              questionScreen1 = true;
              questionScreen2 = false;
              correctAns = 0;
            });
          },
          child: const Text(
            "Reset",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
