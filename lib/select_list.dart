import 'package:flutter/material.dart';

class SelectList extends StatefulWidget {
  SelectList({Key? key}) : super(key: key);

  @override
  State<SelectList> createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  int selectTool = 0;
  List<dynamic> tools = [
    {
      'image': 'https://img.icons8.com/color/344/whatsapp--v4.png',
      'select_image': 'https://img.icons8.com/color/2x/whatsapp--v4.gif',
      'name': 'WhatSapp',
      'description': 'Sosyal Medya Platformu Whatsapp'
    },
    {
      'image': 'https://img.icons8.com/color/344/instagram-new--v1.png',
      'select_image': 'https://img.icons8.com/color/2x/instagram-new--v2.gif',
      'name': 'Instagram',
      'description': 'Sosyal Medya Platformu İnstagram'
    },
    {
      'image': 'https://img.icons8.com/color/344/tiktok--v2.png',
      'select_image': 'https://img.icons8.com/color/2x/tiktok--v2.gif',
      'name': 'Twitter',
      'description': 'Sosyal Medya Platformu Twitter'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Seçili List Uygulaması',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 20),
            Text('Ne Öğrenmek İstersiniz ?',
                style:
                    TextStyle(fontSize: 23, color: Colors.blueGrey.shade400)),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  itemCount: tools.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectTool = index;
                        });
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        margin: const EdgeInsets.only(bottom: 20),
                        duration: const Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                                color: selectTool == index
                                    ? Colors.blue
                                    : Colors.white.withOpacity(0),
                                width: 2),
                            boxShadow: [
                              selectTool == index
                                  ? BoxShadow(
                                      color: Colors.blue.shade100,
                                      offset: const Offset(0, 3),
                                      blurRadius: 10)
                                  : BoxShadow(
                                      color: Colors.grey.shade100,
                                      offset: const Offset(0, 3),
                                      blurRadius: 10),
                            ]),
                        child: Row(
                          children: [
                            selectTool == index
                                ? Image.network(
                                    tools[index]['select_image'],
                                    width: 50,
                                  )
                                : Image.network(tools[index]['image'],
                                    width: 50),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tools[index]['name'],
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  tools[index]['description'],
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                            Icon(
                              Icons.check_circle,
                              color: selectTool == index
                                  ? Colors.blue
                                  : Colors.white,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
