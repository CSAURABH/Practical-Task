import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_task/screens/manage_category_screen.dart';
import 'package:practical_task/screens/manage_company_screen.dart';
import 'package:practical_task/screens/product_screen.dart';
import 'package:practical_task/widgets/my_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Home',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            MyContainer(
              title: 'Products',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductScreen(),
                ),
              ),
            ),
            MyContainer(
              title: 'Manage Category',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageCategory(),
                ),
              ),
            ),
            MyContainer(
              title: 'Manage Company',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageCompany(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
