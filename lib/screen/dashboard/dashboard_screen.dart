import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yah_app/Widget/my_text_from_filed.dart';
import 'package:yah_app/screen/dashboard/add_user_passport.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Dashboard'),
            bottom: const TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: Colors.red),
                  insets: EdgeInsets.symmetric(horizontal: 16.0)),
              indicatorWeight: 4,
              indicatorPadding: EdgeInsets.zero,
              indicatorColor: Colors.red,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                  text: 'إضافة معاملة',
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                  text: 'إضافة خدمة ',
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: 'إضافة إعلان',
                ),
              ],
            )),
        body: TabBarView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: UserDetailsScreen(),
            ),
            InkWell(
              onTap: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) return;
              },
              child: Text('upload'),
            ),
            AddAdver(),
          ],
        ),
      ),
    );
  }

  // int _selectedIndex = 0;
  void _onItemTapped(int index) {}

  void selectScreen(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed('/x1');
  }

  void selectScreen2(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed('/x2');
  }

  void selectScreen3(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed('/x3');
  }
}

class AddDeal extends StatelessWidget {
  const AddDeal({super.key});

  static const String routeName = '/add-deal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة معاملة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'عنوان المعاملة',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'وصف المعاملة',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddAdver extends StatefulWidget {
  const AddAdver({super.key});

  static const String routeName = '/add-adver';

  @override
  State<AddAdver> createState() => _AddAdverState();
}

class _AddAdverState extends State<AddAdver> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة إعلان'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              MyTextFormField(
                hint: 'اسم الاعلان',
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال اسم الاعلان';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'وصف الإعلان',
                  border: OutlineInputBorder(),
                ),
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال وصف الإعلان';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('إضافة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
