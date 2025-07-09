import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_portfolio/app/app.dart';
import 'package:personal_portfolio/model/social_media.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

import '../../model/route_model.dart';

final List<RouteModel> ksMenu = [
  const RouteModel(label: 'Home', route: Routes.home),
  const RouteModel(label: 'Projects', route: Routes.projectsView),
];

const String ksHomeBottomSheetTitle = 'Build Great Apps!';
const String ksHomeBottomSheetDescription =
    'Stacked is built to help you build better apps. Give us a chance and we\'ll prove it to you. Check out stacked.filledstacks.com to learn more';
const String ksHiMyNameIs = "Hi, my name is";
const String ksRealName = "Muhammad Arshad";
const String ksNickName = "Leywino";
const String ksIamA = "I am a";
const String ksFlutterDev = "Flutter Developer";
const String ksKnowMore = "Know More";
const String ksAboutMe = "About Me";
const String ksAboutMeDescription = '''
I’m a passionate Flutter developer who loves building responsive and performant cross-platform apps. I enjoy crafting user-friendly experiences and writing clean, maintainable code. My portfolio reflects my commitment to quality, minimalism, and creativity.

Whether it's a mobile app, a tablet experience, or a polished web view — I strive for pixel-perfect interfaces and efficient architectures using modern tools like Bloc and modular design patterns.

In addition to coding, I enjoy open-source contributions, design system thinking, and pushing the boundaries of what Flutter can do across devices.''';

const String ksGithub = "Github";
const String ksLinkedIn = "LinkedIn";
const String ksDiscord = "Discord";
const String ksSlash = "/";
const String ksVerticalBar = "|";
const String ksViewProjects = "View Projects";
const String ksMadeWith = "Made with Flutter";
const String ksCC = "© 2025 Muhammad Arshad";

const String ksDiscordLink = "https://discordapp.com/users/876696369094598676";
const String ksLinkedInLink = "https://www.linkedin.com/in/muhammadarshadk";
const String ksGithubLink = "https://github.com/leywino";
const String ksWhatsappLink = "https://wa.me/919778490225";
const String ksStackOverflowLink =
    "https://stackoverflow.com/users/22588542/muhammad-arshad";

final List<SocialMedia> ksSocialMedia = [
  SocialMedia(
    link: ksGithubLink,
    icon: FaIcon(
      FontAwesomeIcons.github,
      color: kLightGray,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksLinkedInLink,
    icon: FaIcon(
      FontAwesomeIcons.linkedin,
      color: kLightGray,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksDiscordLink,
    icon: FaIcon(
      FontAwesomeIcons.discord,
      color: kLightGray,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksWhatsappLink,
    icon: FaIcon(
      FontAwesomeIcons.whatsapp,
      color: kLightGray,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksStackOverflowLink,
    icon: FaIcon(
      FontAwesomeIcons.stackOverflow,
      color: kLightGray,
      size: s18,
    ),
  ),
];

const String ksContactInfo = "Contact Info";
const String ksPhone = "+91 9778490225";
const String ksEmail = "mhdarshaddeveloper@gmail.com";
const String ksInspiredFrom = "Inspired from";
const String ksYelwinoo = "Ye Lwin Oo";
const String ksYelwinooLink = "https://ye-lwin-oo.vercel.app/";
const String ksDavid = "David Cobbina";
const String ksDavidLink = "https://davidcobbina.com/";

const String ksWorkingTogether = "Interested in working together?";
const String ksOpenToWork = "I'm open to freelance.";
