import 'package:flutter/material.dart';
import 'package:travelme/colors.dart';
import 'package:travelme/constant.dart';
import 'package:travelme/destinationdetail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.darkSecondaryColor,
                AppColor.lightTertiaryColor,
              ],
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white38,
                    size: 40,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.place,
                    color: AppColor.primaryColor,
                    size: 40,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white38,
                    size: 40,
                  ),
                  onPressed: null),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.secondaryColor,
              AppColor.tertiaryColor,
            ],
          ),
        ),
        child: ListView(
          children: [
            customAppBar(),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destination.length,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 30 : 0),
                        child: destinationCard(
                            context, destination[index]['imagePath']!),
                      )),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot Destination',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotDestination.length,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 30 : 0),
                        child: hotDestinationCard(
                            hotDestination[index]['imagePath']!,
                            hotDestination[index]['placeName']!,
                            hotDestination[index]['placeCount']!,
                            context),
                      )),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Visiter Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '22 Reviews',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 0, left: 25, right: 25, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: AssetImage('assets/woman.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Romeo Agyemang',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Dec 16',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Hello, I am Romeo Agyemang. Welcome to my destination. Its basically a tour guide app. Where you can find your desirable place all over the world. So you can checkout our places.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget hotDestinationCard(String imagePath, String placeName,
      String touristPlaceCount, BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DestinationDetail(imagePath)))
      },
      child: Stack(children: [
        Hero(
          tag: imagePath,
          child: Container(
            height: 200,
            width: 140,
            margin: const EdgeInsets.only(right: 25),
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent]),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  placeName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  touristPlaceCount,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ]),
        ),
      ]),
    );
  }

  Widget destinationCard(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DestinationDetail(imagePath)))
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(right: 20),
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColor.secondaryColor, Colors.transparent],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding customAppBar() {
    return const Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Destination',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          RawMaterialButton(
            constraints: BoxConstraints(minWidth: 0),
            onPressed: null,
            elevation: 2.0,
            fillColor: Colors.white10,
            padding: EdgeInsets.all(8),
            shape: CircleBorder(),
            child: Icon(Icons.search_rounded,
                color: AppColor.primaryColor, size: 30),
          )
        ],
      ),
    );
  }
}
