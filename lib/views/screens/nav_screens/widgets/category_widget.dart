import 'package:eticaret_fullstack/controllers/category_controller.dart';
import 'package:eticaret_fullstack/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<List<CategoryModel>> futureCategoryList;

  @override
  void initState() {
    super.initState();
    futureCategoryList = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: futureCategoryList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print("Snapshot error: ${snapshot.error}");
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final categories = snapshot.data ?? [];
          if (categories.isEmpty) {
            return const Center(child: Text("Kategori bulunamadı"));
          }
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Column(
                children: [
                  Image.network(
                    category.image,
                    fit: BoxFit.cover,
                    width: 47,
                    height: 47,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      print("Image load error: $error");
                      return const Center(child: Text("Resim yüklenemedi"));
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.name,
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
