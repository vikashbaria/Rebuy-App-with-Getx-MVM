import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/utils/colors.dart';
import 'package:rebay/utils/global_widgets/global_header.dart';
import 'package:rebay/utils/global_widgets/textformfield.dart';
import 'package:rebay/views/sidebar/sidebar_screen.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  // Dummy chat list
  final List<Map<String, dynamic>> chatList = [
    {
      "name": "Ali Khan",
      "lastMsg": "Hey! Is the product still available?",
      "time": "10:24 AM",
      "image": "assets/images/productimage/1.jpg",
      "unread": 2,
    },
    {
      "name": "Sara Ahmed",
      "lastMsg": "Okay, I will check and let you know.",
      "time": "Yesterday",
      "image": "assets/images/productimage/2.jpg",
      "unread": 0,
    },
    {
      "name": "Sara Ahmed",
      "lastMsg": "Okay, I will check and let you know.",
      "time": "Yesterday",
      "image": "assets/images/productimage/2.jpg",
      "unread": 0,
    },
    {
      "name": "Sara Ahmed",
      "lastMsg": "Okay, I will check and let you know.",
      "time": "Yesterday",
      "image": "assets/images/productimage/2.jpg",
      "unread": 0,
    },
    {
      "name": "John Smith",
      "lastMsg": "Thank you!",
      "time": "Mon",
      "image": "assets/images/productimage/3.jpg",
      "unread": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalHeader(
              title: "Messages",
              onBackTap: () {
                Get.find<BottomNavController>().changeIndex(0);
              },
              rightWidgets: [
                IconButton(
                  onPressed: () {
                    Get.to(() => SidebarPage());
                  },
                  icon: const Icon(Icons.menu, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 15),

            CustomTextField(
              controller: controller.searchbar,
              hintText: "Search in messages",
              hintStyle: TextStyle(
                fontSize: 18,
                color: AppColors.fontcolor,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: Icon(Icons.search),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final chat = chatList[index];

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Chat open page yahan link karein
                          // Get.to(ChatDetailScreen(user: chat));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                chat["image"],
                                height: 55,
                                width: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        chat["name"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        chat["time"],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 4),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          chat["lastMsg"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                      if (chat["unread"] > 0)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            chat["unread"].toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 25),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
