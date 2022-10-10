import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tweet extends StatefulWidget {
  const Tweet({Key? key}) : super(key: key);

  @override
  State<Tweet> createState() => _TweetState();
}

class _TweetState extends State<Tweet> with TickerProviderStateMixin {
  User user = User(
    name: "Furkan Kilic",
    email: "furkankilicdev",
    time: "20h",
    tweet:
        "UI/Ux alanda kendimi gelistiemek istiyorum. Ogrenmek icin onerdiginiz, kayanaklar, ",
    comments: 16,
    likes: 16,
    retweets: 202,
  );
  bool liked = false;
  bool commented = false;
  bool retweeted = false;

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    _animation = Tween<double>(
      begin: 28,
      end: 24,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.black,
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(
                user.name[0].toUpperCase(),
              ),
            ),
            title: Row(
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' @${user.email}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.tweet,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                liked = !liked;
                                liked ? user.likes += 1 : user.likes -= 1;
                                if (_animationController.value == 1) {
                                  _animationController.reverse();
                                } else {
                                  _animationController.forward();
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: liked
                                    ? Color.lerp(Colors.grey, Colors.red, 1)
                                    : Colors.grey,
                                size: liked ? _animation.value : 24,
                              ),
                            ),
                            Text(
                              '${user.likes}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              child: FaIcon(
                                FontAwesomeIcons.comment,
                                color: commented ? Colors.blue : Colors.grey,
                              ),
                              onTap: () {
                                commented = !commented;
                                commented
                                    ? user.comments += 1
                                    : user.comments -= 1;
                                setState(() {});
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: Text(
                                '${user.comments}  ',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              child: FaIcon(
                                FontAwesomeIcons.retweet,
                                color: retweeted ? Colors.blue : Colors.grey,
                              ),
                              onTap: () {
                                retweeted = !retweeted;
                                retweeted
                                    ? user.retweets += 1
                                    : user.retweets -= 1;
                                setState(() {});
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: Text(
                                '${user.retweets}   ',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const InkWell(
                      child: FaIcon(
                        FontAwesomeIcons.arrowUpFromBracket,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: const Icon(
              Icons.more_horiz,
              color: Color.fromARGB(255, 127, 126, 126),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String time;
  final String tweet;

  int comments;
  int retweets;
  int likes;

  User(
      {required this.name,
      required this.email,
      required this.time,
      required this.tweet,
      required this.comments,
      required this.likes,
      required this.retweets});
}
