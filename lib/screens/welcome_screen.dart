import 'package:flutter/material.dart';

import 'science_screen.dart';
import 'math_screen.dart';
import 'english_screen.dart';
import 'sst_screen.dart';
import 'past_papers_screen.dart';
import 'tutorials_screen.dart';
import 'exercises_screen.dart';
import 'quizzes_screen.dart';
import 'references_screen.dart';
import 'login_screen.dart';
import 'learning_hub_screen.dart';
import 'starter_pack_screen.dart';
import 'app_state.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isMenuOpen = false;
  bool isDarkMode = false;

  final TextEditingController searchController = TextEditingController();

  // ✅ SEARCHABLE CONTENT (WITH PREMIUM CONTROL)
  final List<Map<String, dynamic>> appContent = [
    {"title": "Science Notes", "screen": const ScienceScreen(), "premium": false},
    {"title": "Math Exercises", "screen": const MathScreen(), "premium": false},
    {"title": "English Grammar", "screen": const EnglishScreen(), "premium": false},
    {"title": "SST Topics", "screen": const SSTScreen(), "premium": false},
    {"title": "Past Papers", "screen": const PastPapersScreen(), "premium": true},
  ];

  // ✅ SIDEBAR ITEMS (EXPANDED)
  final List<Map<String, dynamic>> sidebarItems = [
    {"title": "Tutorials", "icon": Icons.menu_book},
    {"title": "Exercises", "icon": Icons.fitness_center},
    {"title": "Quizzes", "icon": Icons.quiz},
    {"title": "References", "icon": Icons.book},
    {"title": "Certificates", "icon": Icons.workspace_premium},
    {"title": "Teachers", "icon": Icons.person},
    {"title": "Settings", "icon": Icons.settings},
    {"title": "About Us", "icon": Icons.info},
  ];

  void _navigate(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  // ✅ SEARCH FUNCTION (SMART + PREMIUM FILTER)
  void _search(String query) {
    if (query.trim().isEmpty) return;

    final results = appContent.where((item) {
      final matches =
          item["title"].toLowerCase().contains(query.toLowerCase());

      final isPremium = item["premium"] ?? false;

      if (!AppState.isLoggedIn && isPremium) {
        return false;
      }

      return matches;
    }).toList();

    if (results.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No results found")),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView(
          children: results.map((item) {
            return ListTile(
              title: Text(item["title"]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                _navigate(item["screen"]);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _handleSidebarClick(String title) {
    setState(() => isMenuOpen = false);

    switch (title) {
      case "Tutorials":
        _navigate(const TutorialsScreen());
        break;
      case "Exercises":
        _navigate(const ExercisesScreen());
        break;
      case "Quizzes":
        _navigate(const QuizzesScreen());
        break;
      case "References":
        _navigate(const ReferencesScreen());
        break;
      case "Settings":
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Settings coming soon")),
        );
        break;
      case "About Us":
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("About us coming soon")),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title coming soon")),
        );
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFF282A35),
      body: Stack(
        children: [
          Column(
            children: [
              // 🔝 NAVBAR (MERGED + IMPROVED)
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: isDarkMode ? Colors.black : Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          setState(() => isMenuOpen = !isMenuOpen),
                      child: Icon(Icons.menu, color: textColor),
                    ),
                    const SizedBox(width: 15),

                    const Icon(Icons.school, color: Color(0xFF04AA6D)),
                    const SizedBox(width: 8),

                    Text(
                      "LearnBox",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(width: 20),

                    // ✅ SUBJECT NAV ITEMS
                    _navItem("Science", textColor),
                    _navItem("Math", textColor),
                    _navItem("English", textColor),
                    _navItem("SST", textColor),
                    _navItem("Past Papers", textColor),

                    const Spacer(),

                    // 🔍 NAV SEARCH
                    Container(
                      width: 220,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              style: TextStyle(color: textColor),
                              decoration: InputDecoration(
                                hintText: "Search...",
                                hintStyle: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white70
                                        : Colors.black54),
                                border: InputBorder.none,
                              ),
                              onSubmitted: _search,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search, color: textColor),
                            onPressed: () =>
                                _search(searchController.text),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // ✅ SIGN IN BUTTON (FIXED FLOW)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF04AA6D),
                      ),
                      onPressed: () {
                        if (AppState.isLoggedIn) {
                          _navigate(const LearningHubScreen());
                        } else {
                          _navigate(const LoginScreen());
                        }
                      },
                      child: Text(
                        AppState.isLoggedIn ? "Continue" : "Sign In",
                      ),
                    ),
                  ],
                ),
              ),

              // 🔥 HERO SECTION
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        "https://images.unsplash.com/photo-1512820790803-83ca734da794",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(color: Colors.black.withOpacity(0.6)),

                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Learn Box",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),

                          const Text(
                            "Smart learning for every primary student",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // 🔍 HERO SEARCH
                          Container(
                            width: 350,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText:
                                    "Search learning materials...",
                                border: InputBorder.none,
                              ),
                              onSubmitted: _search,
                            ),
                          ),

                          const SizedBox(height: 25),

                          ElevatedButton(
                            onPressed: () =>
                                _navigate(const LearningHubScreen()),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF04AA6D),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            child: const Text("Start Learning"),
                          ),

                          const SizedBox(height: 10),

                          TextButton(
                            onPressed: () =>
                                _navigate(const StarterPackScreen()),
                            child: const Text(
                              "Not sure where to begin?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // 🌑 BACKDROP
          if (isMenuOpen)
            GestureDetector(
              onTap: () =>
                  setState(() => isMenuOpen = false),
              child: Container(color: Colors.black54),
            ),

          // 📌 SIDEBAR
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            left: isMenuOpen ? 0 : -260,
            top: 0,
            bottom: 0,
            child: Container(
              width: 260,
              color: isDarkMode ? Colors.black : Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text("MENU",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView.builder(
                      itemCount: sidebarItems.length,
                      itemBuilder: (context, index) {
                        final item = sidebarItems[index];

                        return ListTile(
                          leading:
                              Icon(item["icon"], color: textColor),
                          title: Text(item["title"],
                              style: TextStyle(color: textColor)),
                          onTap: () =>
                              _handleSidebarClick(item["title"]),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dark Mode",
                          style: TextStyle(color: textColor)),
                      Switch(
                        value: isDarkMode,
                        onChanged: (val) =>
                            setState(() => isDarkMode = val),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ NAV ITEM BUILDER
  Widget _navItem(String title, Color textColor) {
    return TextButton(
      onPressed: () {
        switch (title) {
          case "Science":
            _navigate(const ScienceScreen());
            break;
          case "Math":
            _navigate(const MathScreen());
            break;
          case "English":
            _navigate(const EnglishScreen());
            break;
          case "SST":
            _navigate(const SSTScreen());
            break;
          case "Past Papers":
            _navigate(const PastPapersScreen());
            break;
        }
      },
      child: Text(title, style: TextStyle(color: textColor)),
    );
  }
}