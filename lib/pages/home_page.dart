import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page "),
        backgroundColor: Colors.indigo,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.commentDots,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: const Text(
                  "software engineering student at north american university "),
            ),
            const SizedBox(height: 20.0),
            _buildTitle("Education History"),
            const SizedBox(height: 5.0),
            _buildExperienceRow(
                company: "NORTH AMERICAN UNIVERSITY,SFAX",
                position: "Engineering Study-2nd year",
                duration: "2022- 2025"),
            _buildExperienceRow(
                company: "PREPARATORY INSTITUTE FOR ENGINEERING STUDIES,GABES",
                position: "Technology-physics",
                duration: "2020 - 2022"),
            _buildTitle("Extracurricular AcTivities"),
            const SizedBox(height: 5.0),
            _buildExperienceRow(
                company: "IIT ROBOTICS CLUB",
                position: "Active member",
                duration: "2022- present"),
            _buildExperienceRow(
                company: "IIT PYTHON CLUB",
                position: "Active member",
                duration: "2022- present"),
            _buildTitle("Contact"),
            const SizedBox(height: 5.0),
            Row(
              children: const <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.mail,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  "minyarbenmabrouk54@gmail.com",
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.phone,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  "+216-21544907",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            _buildSocialsRow(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.facebookF),
          onPressed: () {
            _launchURL("https://facebook.com/minyarbenmabrouk");
          },
        ),
        const SizedBox(width: 5.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.github),
          onPressed: () {
            _launchURL("https://github.com/benmabrouk_minyar");
          },
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow(
      {required String company, String? position, String? duration}) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20.0),
        SizedBox(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  child: Image.asset("assets/avtar1.png"),
                  radius: 35.0,
                ))),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "BENMABROUK Minyar",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text("Software engineering student"),
            const SizedBox(height: 5.0),
            Row(
              children: const <Widget>[
                Icon(
                  FontAwesomeIcons.map,
                  size: 12.0,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Sfax, Tunisia",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
