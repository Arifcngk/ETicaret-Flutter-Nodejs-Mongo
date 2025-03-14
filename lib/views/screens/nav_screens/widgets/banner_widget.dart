import 'package:eticaret_fullstack/controllers/banner_controller.dart';
import 'package:eticaret_fullstack/models/banner_model.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> futureBannerList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBannerList = BannerController().loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: FutureBuilder(
          future: futureBannerList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final banners = snapshot.data;
              return PageView.builder(
                itemCount: banners!.length,
                itemBuilder: (context, index) {
                  final banner = banners[index];
                  return Image.network(
                    banner.image,
                    fit: BoxFit.cover,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
