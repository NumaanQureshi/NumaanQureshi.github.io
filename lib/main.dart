import 'dart:ui'; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numaan Qureshi Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, 
          foregroundColor: Colors.black,
          elevation: 0,
          scrolledUnderElevation: 0, 
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();

  late ScrollController _scrollController; 

  final List<Map<String, String>> _projects = [
    {
      'name': 'Journey - Al-Assisted Fitness Tracking App',
      'image': 'assets/images/updated_journey_logo.png',
    },
    {
      'name': 'PWVault - Encrypted Password & Notes Storage',
      'image': 'assets/images/pwvault_logo.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.grey[200]!.withValues(alpha: 0.7),
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), 
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: InkWell(
          onTap: () => _launchUrl('https://github.com/NumaanQureshi'),
          borderRadius: BorderRadius.circular(20),
          child: ClipOval(
            child: Image.asset(
              'assets/images/pfp.jpg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.account_circle, size: 40),
            ),
          ),
        ),
        actions: [
          _navButton('Work', _projectsKey),
          _navButton('About', _aboutKey),
          const SizedBox(width: 20),
        ],
      ),
      body: WebSmoothScroll(
        controller: _scrollController,
        scrollAnimationLength: 1000,
        curve: Curves.easeOutQuart,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(key: _heroKey, child: _buildHeroSection(context)),
              Container(key: _projectsKey, child: _buildProjectsSection(context)),
              Container(key: _aboutKey, child: _buildAboutSection(context)),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(String title, GlobalKey targetKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => _scrollToSection(targetKey),
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 160, bottom: 120, left: 20, right: 20),
      color: const Color(0xFFFAFAFA),
      child: Column(
        children: [
          Text(
            'Numaan Qureshi',
            style: GoogleFonts.inter(
              fontSize: 56,
              fontWeight: FontWeight.w800,
              height: 1.1,
              letterSpacing: -1.5,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Aspiring Cybersecurity Professional',
            style: GoogleFonts.inter(fontSize: 18, color: Colors.grey[600], fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildSocialLink('assets/images/email.svg', 'numaanqureshi05@gmail.com', 'mailto:numaanqureshi05@gmail.com'),
              _buildSocialLink('assets/images/linkedin.svg', 'linkedin.com/in/numaan-q/', 'https://www.linkedin.com/in/numaan-q/'),
              _buildSocialLink('assets/images/github.svg', 'github.com/NumaanQureshi', 'https://www.github.com/NumaanQureshi'),
            ],
          ),
          
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildSocialLink(String iconPath, String label, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected Work',
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900 ? 2 : 1; 
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.5,
                ),
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(2), 
        border: Border.all(color: Colors.black12), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0), 
              color: const Color(0xFFEEEEEE),
              child: Image.asset(
                _projects[index]['image']!,
                fit: BoxFit.contain, 
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.image_outlined, size: 40, color: Colors.black26),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _projects[index]['name']!,
              style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) { 
    return Container(
      width: double.infinity,
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5),
          ),
          const SizedBox(height: 24),
          Text(
            'Computer Science graduate pursuing an M.S. in Computer Science at CUNY Brooklyn College.\n'
            'Experience building full-stack applications using C++, Python, Flutter, PostgreSQL, and Google Cloud.\n'
            'Passionate about software engineering and application security.\n'
            'Currently pursuing: CompTIA Security+.\n',
            style: GoogleFonts.inter(fontSize: 18, color: Colors.black87, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.black,
      child: Center(
        child: Text(
          '© 2026 Numaan Qureshi. All rights reserved.',
          style: GoogleFonts.inter(color: Colors.white54, fontSize: 12),
        ),
      ),
    );
  }
}