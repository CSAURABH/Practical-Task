import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5.sp),
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: ExpansionTile(
                    title: const Text("Category"),
                    onExpansionChanged: (value) {
                      setState(() {});
                    },
                    children: const [
                      ListTile(
                        title: Text("Expanded Content"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(width: 0.5.sp),
                  ),
                  child: ExpansionTile(
                    title: const Text("Company Name"),
                    onExpansionChanged: (value) {
                      setState(() {});
                    },
                    children: const [
                      ListTile(
                        title: Text("Expanded Content"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Color(0xff6D7072)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
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
                Text(
                  'Upload Image:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff6D7072),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 42.h,
                      width: 80.48.w,
                      child: const Card(
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      height: 42.h,
                      width: 80.48.w,
                      child: const Card(
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      height: 42.h,
                      width: 80.48.w,
                      child: const Card(
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      height: 42.h,
                      width: 80.48.w,
                      child: const Card(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Minimum 2 Image',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff6D7072),
                    ),
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
