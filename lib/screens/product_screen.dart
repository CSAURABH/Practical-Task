import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_task/screens/add_products.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff6D7072),
          title: Text(
            'Products',
            style: TextStyle(
              fontSize: 24.sp,
              color: const Color(0xffFFFFFF),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProducts(),
                  ),
                );
              },
              child: Icon(Icons.add, size: 21.68.sp),
            ),
            SizedBox(width: 16.23.sp),
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 77.h,
                          width: 77.w,
                          child: const Card(
                            color: Color(0xff6D7072),
                            child: Center(
                              child: Text('Image'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              'LG LCD Monitor',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff6D7072)),
                            ),
                            Text(
                              'Computer & Accessories',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: const Color(0xff6D7072)),
                            ),
                            Text(
                              'Qty : 05',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xff6D7072)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 77.w,
                          height: 28.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff6D7072),
                            ),
                            onPressed: () {},
                            child: const Text('Edit'),
                          ),
                        ),
                        SizedBox(height: 19.h),
                        SizedBox(
                          width: 77.w,
                          height: 28.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff6D7072),
                            ),
                            onPressed: () {},
                            child: const Text('Delete'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
