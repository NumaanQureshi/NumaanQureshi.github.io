import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/about_section.dart';
import 'sections/footer_section.dart';
import 'utils/url_helper.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();

  late final ScrollController _scrollController;

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

  @override
  Widget build(BuildContext context) {
    final bool isDesktopWeb = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux);

    Widget scrollableView = SingleChildScrollView(
      controller: _scrollController,
      physics: isDesktopWeb
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      child: Column(
        children: [
          HeroSection(key: _heroKey),
          ProjectsSection(key: _projectsKey),
          AboutSection(key: _aboutKey),
          const FooterSection(),
        ],
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF07070A).withValues(alpha: 0.65),
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: Border(
          bottom: BorderSide(color: const Color(0xFFFFFFFF).withValues(alpha: 0.06), width: 1),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: InkWell(
          onTap: () => launchExternalUrl('https://github.com/NumaanQureshi'),
          borderRadius: BorderRadius.circular(20),
          child: ClipOval(
            child: Image.asset(
              'assets/images/pfp.jpg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.account_circle, size: 40),
            ),
          ),
        ),
        actions: [
          _NavButton(
            title: 'Work',
            onPressed: () => _scrollToSection(_projectsKey),
          ),
          _NavButton(
            title: 'About',
            onPressed: () => _scrollToSection(_aboutKey),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: isDesktopWeb
          ? WebSmoothScroll(
              controller: _scrollController,
              scrollAnimationLength: 1000,
              curve: Curves.easeOutQuart,
              child: scrollableView,
            )
          : scrollableView,
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const _NavButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFE5E7EB),
          overlayColor: const Color(0xFF34D399).withValues(alpha: 0.12),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}