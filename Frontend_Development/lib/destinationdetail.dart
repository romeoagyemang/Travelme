import 'package:flutter/material.dart';
import 'package:travelme/colors.dart';

class DestinationDetail extends StatefulWidget {
  final String imagePath;
  const DestinationDetail(this.imagePath, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DestinationDetailState createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DestinationPage(
      controller: _controller,
      imagePath: widget.imagePath,
      key: UniqueKey(),
    );
  }
}

class DestinationPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final imagePath;
  DestinationPage(
      {required Key key,
      required AnimationController controller,
      this.imagePath})
      : animation = DestinationPageEnterAnimation(controller),
        super(key: key);
  final DestinationPageEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => _buildAnimation(context),
    );
  }

  Hero _buildAnimation(BuildContext context) {
    return Hero(
      tag: imagePath,
      child: Scaffold(
          floatingActionButton: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width - 60,
            height: 80,
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: AppColor
                    .lightSecondary, // Use primary for the button's color
              ),
              child: const Text(
                'Bookmark Destination',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white70,
                            size: 40,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: null,
                          shape: const CircleBorder(),
                          fillColor: Colors.white30,
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/info.png',
                            width: 4,
                          ),
                        )
                      ],
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height - 350,
                      height: animation.barHeight.value,
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'America',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'The Official Visitors Guide Has Tons Of Ideas For How To Spend A Day Or Weekend In CLE. Fill Up A Day Trip Or Make It A Night Out With The Latest Official Visitors Guide. View Event Calendar. Sign Up For Updates. Check Blog.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white38,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tourist Places',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '18',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white24,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    hotDestinationCard('assets/bridge.jpg',
                                        'AMERICA', '18 Tourist Place', context),
                                    hotDestinationCard('assets/japan-home.jpg',
                                        'JAPAN', '18 Tourist Place', context),
                                    hotDestinationCard('assets/city.jpg',
                                        'NEWYORK', '18 Tourist Place', context),
                                  ],
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
            ],
          )),
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
        Container(
          height: 160,
          width: 160,
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
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent]),
            ),
          ),
        ),
      ]),
    );
  }
}

class DestinationPageEnterAnimation {
  DestinationPageEnterAnimation(this.controller)
      : barHeight = Tween<double>(begin: 0, end: 600).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.5),
          ),
        );

  final AnimationController controller;
  final Animation<double> barHeight;
}
