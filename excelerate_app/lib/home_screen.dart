import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List of sidebar items
  final List<Map<String, dynamic>> _menuItems = [
    {"icon": Icons.dashboard_outlined, "title": "Dashboard"},
    {"icon": Icons.work_outline, "title": "Careers"},
    {"icon": Icons.school_outlined, "title": "Internships"},
    {"icon": Icons.event_outlined, "title": "Events"},
    {"icon": Icons.book_outlined, "title": "Courses"},
    {"icon": Icons.class_outlined, "title": "Classes"},
    {"icon": Icons.support_agent_outlined, "title": "Support Center"},
  ];

  String selectedMenu = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        selectedMenu,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildCardGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Top bar with menu icon + title
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          Text(
            "Home",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF7F00FF)),
          ),
        ],
      ),
    );
  }

  // Sidebar navigation drawer
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF1C1C1E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Color(0xFF7F00FF)),
                ),
                const SizedBox(width: 15),
                Text(
                  "Welcome, 👋",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ..._menuItems.map((item) {
            return ListTile(
              leading: Icon(item["icon"], color: Colors.white70),
              title: Text(
                item["title"],
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedMenu = item["title"];
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
          const Spacer(),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: Text(
              "Logout",
              style: GoogleFonts.poppins(color: Colors.redAccent),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Dashboard content area
  Widget _buildCardGrid() {
    final cards = [
      {"icon": Icons.analytics_outlined, "title": "Stats"},
      {"icon": Icons.people_alt_outlined, "title": "Community"},
      {"icon": Icons.notifications_outlined, "title": "Updates"},
      {"icon": Icons.settings_outlined, "title": "Settings"},
    ];

    return GridView.builder(
      itemCount: cards.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final card = cards[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(card["icon"] as IconData, size: 45, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                card["title"] as String,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
