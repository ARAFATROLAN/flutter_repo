import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'app_state.dart';

// ✅ DEMO SCREENS FOR NAVBAR & SIDEBAR
class DemoPage extends StatelessWidget {
  final String title;
  const DemoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: Center(
        child: Text(
          "Welcome to $title!",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ✅ STARTER PACK PAGE
class StarterPackPage extends StatelessWidget {
  const StarterPackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Getting Started"), backgroundColor: const Color(0xFF04AA6D)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              "Welcome to LearnBox Starter Pack!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text("Here you can explore Science, Math, English, and SST materials."),
            SizedBox(height: 10),
            Text("Try exercises, tutorials, and references to get started!"),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isMenuOpen = false;
  bool isDarkMode = false;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController midSearchController = TextEditingController();

  final List<Map<String, dynamic>> sidebarItems = [
    {"title": "Tutorials", "icon": Icons.menu_book},
    {"title": "Exercises", "icon": Icons.fitness_center},
    {"title": "References", "icon": Icons.book},
    {"title": "Certificates", "icon": Icons.workspace_premium},
    {"title": "Teachers", "icon": Icons.person},
    {"title": "Settings", "icon": Icons.settings},
    {"title": "About Us", "icon": Icons.info},
  ];

  void _navigate(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  // 🔍 SEARCH FUNCTION (currently prints query)
  void _searchWeb(String query) {
    if (query.trim().isEmpty) return;
    print("Search query: $query");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You searched: $query")),
    );
  }

  void _handleSidebarClick(String title) {
    setState(() => isMenuOpen = false);
    _navigate(DemoPage(title: title));
  }

  @override
  void dispose() {
    searchController.dispose();
    midSearchController.dispose();
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
              // 🔝 NAVBAR
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black : Colors.white,
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => isMenuOpen = !isMenuOpen),
                      child: Icon(Icons.menu, color: textColor),
                    ),
                    const SizedBox(width: 15),
                    const Icon(Icons.school, color: Color(0xFF04AA6D)),
                    const SizedBox(width: 8),
                    Text(
                      "LearnBox",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
                    ),
                    const SizedBox(width: 20),
                    _navItem("Science", textColor),
                    _navItem("Math", textColor),
                    _navItem("English", textColor),
                    _navItem("SST", textColor),
                    _navItem("Past Papers", textColor),
                    const Spacer(),
                    // 🔍 NAVBAR SEARCH
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
                                hintText: "Search the web...",
                                hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                                border: InputBorder.none,
                              ),
                              onSubmitted: _searchWeb,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search, color: textColor),
                            onPressed: () => _searchWeb(searchController.text),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // 🔐 SIGN IN
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF04AA6D)),
                      onPressed: () => _navigate(const LoginScreen()),
                      child: const Text("Sign In"),
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
                            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Smart learning for every primary student",
                            style: TextStyle(color: Colors.amber, fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          // 🔍 MIDDLE SEARCH
                          Container(
                            width: 350,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                            child: TextField(
                              controller: midSearchController,
                              decoration: const InputDecoration(
                                hintText: "Search learning materials...",
                                border: InputBorder.none,
                              ),
                              onSubmitted: _searchWeb,
                            ),
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () => _navigate(const StarterPackPage()),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF04AA6D),
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            ),
                            child: const Text("Start Learning"),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () => _navigate(const StarterPackPage()),
                            child: const Text("Not sure where to begin?", style: TextStyle(color: Colors.white)),
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
              onTap: () => setState(() => isMenuOpen = false),
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
                  Text("MENU", style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sidebarItems.length,
                      itemBuilder: (context, index) {
                        final item = sidebarItems[index];
                        return ListTile(
                          leading: Icon(item["icon"], color: textColor),
                          title: Text(item["title"], style: TextStyle(color: textColor)),
                          onTap: () => _handleSidebarClick(item["title"]),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dark Mode", style: TextStyle(color: textColor)),
                      Switch(value: isDarkMode, onChanged: (val) => setState(() => isDarkMode = val)),
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

  // ✅ NAVBAR ITEM BUILDER
  Widget _navItem(String title, Color textColor) {
    return TextButton(onPressed: () => _navigate(DemoPage(title: title)), child: Text(title, style: TextStyle(color: textColor)));
  }
}