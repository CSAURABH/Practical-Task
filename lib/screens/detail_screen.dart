import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  Map<String, dynamic> details;
  DetailScreen({
    Key? key,
    required this.details,
  }) : super(key: key);

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
    print(widget.details);
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
                        widget.details['product-name'],
                        style: TextStyle(
                          color: const Color(0xff6D7072),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        widget.details['category'],
                        style: TextStyle(
                          color: const Color(0xff6D7072),
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        widget.details['company'],
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
                        text: TextSpan(
                          text: 'Price: ',
                          style: const TextStyle(
                            color: Color(0xff6D7072),
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: widget.details['price-name'],
                              style: const TextStyle(
                                color: Color(0xff6D7072),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 17.h),
                      RichText(
                        text: TextSpan(
                          text: 'Qty: ',
                          style: const TextStyle(
                            color: Color(0xff6D7072),
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: widget.details['qty-name'],
                              style: const TextStyle(
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
                widget.details['description-name'],
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
