import 'package:get/get.dart';
import 'package:rebay/models/product_model.dart';

class PurchaseFormController extends GetxController {
  var shippingAddress = ''.obs;
  var invoiceDetails = ''.obs;

  void setShippingAddress(String value) => shippingAddress.value = value;
  void setInvoiceDetails(String value) => invoiceDetails.value = value;

  void proceedToPayment(ProductModel product) {
    Get.to(
      '/payment',
      arguments: {
        'product': product,
        'shippingAddress': shippingAddress.value,
        'invoiceDetails': invoiceDetails.value,
      },
    );
  }
}
