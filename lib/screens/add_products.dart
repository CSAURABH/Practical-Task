import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController productName = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();

  addProduct() async {
    String pName = productName.text.trim();
    // String catName = categoryName.text.trim();
    // String cpyName = companyName.text.trim();
    String descName = description.text.trim();
    String priceName = price.text.trim();
    String qtyName = quantity.text.trim();

    if (productName.text.trim().isEmpty ||
        description.text.trim().isEmpty ||
        price.text.trim().isEmpty ||
        quantity.text.trim().isEmpty) {
    } else {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('Product');
      Map<String, dynamic> product = {
        'product-name': pName,
        'description-name': descName,
        'price-name': priceName,
        'qty-name': qtyName,
      };
      companyName.clear();
      return collectionReference.add(product);
    }
  }

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
                  controller: productName,
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
                  controller: description,
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
                  controller: price,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Price',
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: quantity,
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
                    onPressed: () {
                      addProduct();
                    },
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
