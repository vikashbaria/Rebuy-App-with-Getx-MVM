import 'package:get/get.dart';
import 'package:rebay/models/listings.dart';

class ListingController extends GetxController {
  var listings = <Listing>[].obs;

  @override
  void onInit() {
    super.onInit();
    listings.addAll([
      Listing(
        avatarUrl:
            "https://scontent.fkhi10-1.fna.fbcdn.net/v/t39.30808-6/248229040_4422302187884985_7319573855011673340_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH0f3trJQbx82D0ex3aJBbxeGDgpzzK8Al4YOCnPMrwCTiI-2EXLSK5VstIvV55AlfnxjwTZg0wZPATzjexDFHM&_nc_ohc=CfnAJVIH9CUQ7kNvwGiBq35&_nc_oc=Adn6kgYTc7a8Bg18IsVcCtmAn6U67i02OVyfeQJKZsn2dFzYzWKciv3NTTsgtQqwzkc&_nc_zt=23&_nc_ht=scontent.fkhi10-1.fna&_nc_gid=A_CeV7QqjgoxqWErbEEMYQ&oh=00_AfloFwmJkGNHzoFmwpXad_GuFOFPoZhNxMq--EXhbvFwGQ&oe=69346A31",
        title: "Vikash Baria",
        location: "Landa Bazar Ka Maal",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?q=80&w=578&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        name: "Modern Villa",
        make: "Luxury",
        year: "2023",
        price: "\$350,000",
      ),
      Listing(
        avatarUrl:
            "https://scontent.fkhi10-1.fna.fbcdn.net/v/t39.30808-6/248229040_4422302187884985_7319573855011673340_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH0f3trJQbx82D0ex3aJBbxeGDgpzzK8Al4YOCnPMrwCTiI-2EXLSK5VstIvV55AlfnxjwTZg0wZPATzjexDFHM&_nc_ohc=CfnAJVIH9CUQ7kNvwGiBq35&_nc_oc=Adn6kgYTc7a8Bg18IsVcCtmAn6U67i02OVyfeQJKZsn2dFzYzWKciv3NTTsgtQqwzkc&_nc_zt=23&_nc_ht=scontent.fkhi10-1.fna&_nc_gid=A_CeV7QqjgoxqWErbEEMYQ&oh=00_AfloFwmJkGNHzoFmwpXad_GuFOFPoZhNxMq--EXhbvFwGQ&oe=69346A31",
        title: "Shanto Lala",
        location: "Nipa Chowrangi",
        imageUrl:
            "https://images.unsplash.com/photo-1572635196237-14b3f281503f?q=80&w=580&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        name: "City Apartment",
        make: "Standard",
        year: "2022",
        price: "\$180,000",
      ),
    ]);
  }

  void toggleFavorite(int index) {
    print("Toggle favorite for ${listings[index].name}");
  }
}
