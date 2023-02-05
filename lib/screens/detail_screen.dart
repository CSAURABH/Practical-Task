import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late PageController _pageController;
  List<String> images = [
    // "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    // "https://wallpaperaccess.com/full/2637581.jpg",
    // "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Detail Screen',
          style: TextStyle(
            fontSize: 24.sp,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(17.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150.h,
                width: 342.w,
                child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  itemBuilder: (context, pagePosition) {
                    return Image.network(images[pagePosition]);
                  },
                ),
              ),
              SizedBox(height: 17.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LG LCD Monitor',
                        style: TextStyle(
                          color: const Color(0xff6D7072),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Computer & Accessories',
                        style: TextStyle(
                          color: const Color(0xff6D7072),
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Opel Pvt. Ltd',
                        style: TextStyle(
                          color: const Color(0xff6D7072),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Price: ',
                          style: TextStyle(
                            color: Color(0xff6D7072),
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: '4500/-',
                              style: TextStyle(
                                color: Color(0xff6D7072),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 17.h),
                      RichText(
                        text: const TextSpan(
                          text: 'Qty: ',
                          style: TextStyle(
                            color: Color(0xff6D7072),
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: '05',
                              style: TextStyle(
                                color: Color(0xff6D7072),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 27.h),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff6D7072),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xff6D7072),
                ),
              ),
              SizedBox(height: 27.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 155.w,
                    height: 44.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6D7072),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 155.w,
                    height: 44.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6D7072),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
