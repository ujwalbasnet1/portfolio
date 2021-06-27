import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helper/ui_helpers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0D37),
      appBar: _appBar(context),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 64,
          vertical: 32,
        ),
        children: [
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

          SizedBox(height: 120),
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
          // Row(
          //   children: [
          //     Expanded(child: _introSection(context)),
          //     _imageSection(context),
          //   ],
          // ),
        ],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            InkWell(
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
          ],
        ),
      );
}
