import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helper/ui_helpers.dart';

const padding = const EdgeInsets.symmetric(
  horizontal: 64,
  vertical: 32,
);

class SectionModel {
  final Widget section;
  final String title;

  SectionModel(this.title, this.section);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    _controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  List<SectionModel> get pages => [
        SectionModel(
          "Introduction",
          Row(
            children: [
              Container(
                width: screenWidth(context) * 0.35,
                height: screenHeight(context, 0.9),
                child: Center(
                  child: Container(
                    width: screenWidth(context, 0.5),
                    child: _introSection(context),
                  ),
                ),
              ),
              Expanded(child: _imageSection(context)),
            ],
          ),
        ),
        SectionModel(
          "Portfolios",
          Row(
            children: [
              Expanded(child: _imageSection(context)),
              Container(
                width: screenWidth(context) * 0.35,
                height: screenHeight(context, 0.9),
                child: Center(
                  child: Container(
                    width: screenWidth(context, 0.5),
                    child: _introSection(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        SectionModel(
          "Testimonials",
          Row(
            children: [
              Container(
                width: screenWidth(context) * 0.35,
                height: screenHeight(context, 0.9),
                child: Center(
                  child: Container(
                    width: screenWidth(context, 0.5),
                    child: _introSection(context),
                  ),
                ),
              ),
              Expanded(child: _imageSection(context)),
            ],
          ),
        ),
        SectionModel(
          "Contact",
          Row(
            children: [
              Expanded(child: _imageSection(context)),
              Container(
                width: screenWidth(context) * 0.35,
                height: screenHeight(context, 0.9),
                child: Center(
                  child: Container(
                    width: screenWidth(context, 0.5),
                    child: _introSection(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        SectionModel(
          "Location",
          Row(
            children: [
              Container(
                width: screenWidth(context) * 0.35,
                height: screenHeight(context, 0.9),
                child: Center(
                  child: Container(
                    width: screenWidth(context, 0.5),
                    child: _introSection(context),
                  ),
                ),
              ),
              Expanded(child: _imageSection(context)),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0D37),
      appBar: _appBar(context),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(right: tocWidth),
              child: PageView(
                onPageChanged: (index) => setState(() => _currentIndex = index),
                controller: _controller,
                scrollDirection: Axis.vertical,
                children: pages
                    .map(
                      (e) => Padding(
                        padding: padding,
                        child: e.section,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 0,
            top: 0,
            child: _indicatorWidget(context),
          ),
        ],
      ),
    );
  }

  double tocWidth = 44;

  Widget _indicatorWidget(BuildContext context) {
    return Center(
      child: Container(
        width: tocWidth,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            String str = (index + 1).toString();
            if ((index + 1) <= 9) str = "0" + str;

            return InkWell(
              onTap: (_currentIndex == index)
                  ? null
                  : () {
                      _controller.animateToPage(
                        index,
                        duration: Duration(
                            milliseconds: (_currentIndex - index).abs() * 300),
                        curve: Curves.easeIn,
                      );
                    },
              borderRadius: BorderRadius.circular(32),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 8,
                ),
                child: Text(
                  str,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: (_currentIndex == index)
                            ? Colors.white
                            : Colors.white54,
                        fontSize: (_currentIndex == index) ? 24 : null,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(height: 0),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) => PreferredSize(
        preferredSize: Size.fromHeight(96),
        child: Row(
          children: [
            Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 48,
              ),
              child: Text(
                "Portfolio",
                style: GoogleFonts.cedarvilleCursive().copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _imageSection(BuildContext context) => Container(
        height: screenHeight(context, 0.9),
        constraints: BoxConstraints(
          maxHeight: 1000,
          maxWidth: 1000,
        ),
        child: Image.asset(
          "assets/user.png",
          fit: BoxFit.scaleDown,
        ),
      );

  Widget _introSection(BuildContext context) => Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text(
              "Hello, I am",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(),
            ),
            Text(
              // "App Developer & Designer",
              "Ujwal Basnet",
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 4),
            Text(
              "App Developer & Designer",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
            ),
            SizedBox(height: 12),
            Text(
              "Experienced mobile app developer who has a track record of success creating apps that are both well-received and commercially viable. Skilled with working as a team and incorporating input into projects. Ability to always look for ways to improve upon an already existing app to keep people downloading it and enjoying it. Strong eye for detail and tenacity to never quit on something until it is absolutely perfect.",
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.white24,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            SizedBox(height: 24),
            Text(
              "You can find me on",
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.white24,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram, size: 20),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook, size: 20),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.google, size: 20),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  // TODO
                },
                borderRadius: BorderRadius.circular(32),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Text(
                    "Hire Me",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
