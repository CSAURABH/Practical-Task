import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageCompany extends StatelessWidget {
  const ManageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Company',
          style: TextStyle(
            fontSize: 24.sp,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Company Name',
                ),
              ),
              SizedBox(height: 21.26.sp),
              SizedBox(
                width: 342.77.w,
                height: 44.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6D7072),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(height: 41.sp),
              Text(
                "List of companies",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff6D7072),
                ),
              ),
              SizedBox(height: 12.sp),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Card(
                      color: const Color(0xff6D7072),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 17.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ABB Ltd.",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xffFFFFFF),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.delete,
                              size: 18.sp,
                              color: const Color(0xffFFFFFF),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
