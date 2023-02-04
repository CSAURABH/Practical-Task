import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Add Products',
          style: TextStyle(
            fontSize: 24.sp,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Product Name',
                  ),
                ),
                SizedBox(height: 16.h),
                const ExpansionTile(
                  title: Text('Category'),
                  children: [
                    ListTile(title: Text('This is tile number 1')),
                  ],
                ),
                SizedBox(height: 16.h),
                const ExpansionTile(
                  title: Text('Company Name'),
                  children: [
                    ListTile(title: Text('This is tile number 1')),
                    ListTile(title: Text('This is tile number 1')),
                    ListTile(title: Text('This is tile number 1')),
                    ListTile(title: Text('This is tile number 1')),
                    ListTile(title: Text('This is tile number 1')),
                    ListTile(title: Text('This is tile number 1')),
                  ],
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Price',
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Qty',
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 342.77.w,
                  height: 44.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6D7072),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
