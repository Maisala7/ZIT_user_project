import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  var success;
  var token;

  void printStreamedResponse(http.StreamedResponse response) {
    final buffer = StringBuffer(); // Buffer to accumulate the response body

    response.stream.listen(
      (data) {
        buffer.write(
            utf8.decode(data)); // Convert bytes to string and append to buffer
      },
      onDone: () {
        //print(buffer.toString()); // //Print the accumulated response body
      },
      onError: (error) {
        print('Error: $error');
      },
      cancelOnError: true, // Cancel the stream on error
    );
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  loginData({required String username, required String password}) async {
    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com//login');
    final response = await http
        .post(myUrl, body: {"username": username, "password": password});
    var data = json.decode(response.body);
    success = data['success'];
    ////print('success = $success');
    if (success) {
      _save(data['data']['token']);
      print(data['data']);
      return data['data'];
    } else {
      print(data['message']);
    }
  }

  registerData({
    required String username,
    required String password,
    required String email,
    required String phoneNumber,
    required String gender,
  }) async {
    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com//register');
    final response = await http.post(myUrl, body: {
      "username": username,
      "password": password,
      "email": email,
      "PhoneNumber": phoneNumber,
      "Gender": gender,
    });
    var data = json.decode(response.body);
    success = data['success'];
    ////print('success = $success');
    if (success) {
      print(data['data']);
      return data['data'];
    } else {
      print(data['message']);
    }
  }

  Future<List> getStores() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getstores');
    final response =
        await http.get(myUrl, headers: {'Authorization': 'token $value'});
    var data = json.decode(response.body);
    success = data['success'];
    ////print('success = $success');
    if(!success){
      print(data['message']);
    }
    return data['data'];
  }

  Future<List> getStoreCategories({required String storeID}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getstorecategories');
    var response = await http.post(myUrl,
        headers: {'Authorization': 'token $value'}, body: {"Store": storeID});
    var data = json.decode(response.body);
    success = data['success'];
    if(!success){
      print(data['message']);
    }
    return data['data'];
  }

  Future<List> getStoreProducts({required String storeID}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getstoreproducts');
    var response = await http.post(myUrl,
        headers: {'Authorization': 'token $value'}, body: {"Store": storeID});
    var data = json.decode(response.body);
    success = data['success'];
    if(!success){
      print(data['message']);
    }
    return data['data'];
  }

  Future<List> getCategoryProducts({required String catogory}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl =
        Uri.parse('https://vzzoz.pythonanywhere.com/getcategoryproducts');
    var response = await http.post(myUrl,
        headers: {'Authorization': 'token $value'},
        body: {"Category": catogory});
    var data = json.decode(response.body);
    success = data['success'];
    if(!success){
      print(data['message']);
    }
    return data['data'];
  }

  Future<List> getMyOrders() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getuserorders');
    final response =
        await http.get(myUrl, headers: {'Authorization': 'token $value'});
    var data = json.decode(response.body);
    success = data['success'];
    if(!success){
      print(data['message']);
    }

    return data['data'];
  }

  Future<void> addToCart({
    required String id,
    required String name,
    required String price,
    required String image,
    required String description,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.getString(key) ?? '';

    // Retrieve the current cart products
    List<String> cartProducts =
        prefs.getStringList('cartProducts_$value') ?? [];

    // Check if the product with the same ID already exists
    bool isProductExist = cartProducts.any((productJson) {
      Map<String, dynamic> product = json.decode(productJson);
      return product['id'] == id;
    });

    if (!isProductExist) {
      Map<String, dynamic> product = {
        'id': id,
        'Name': name,
        'Price': price,
        'Image': image,
        'Description': description,
        'Quantity': 1,
      };

      cartProducts.add(json.encode(product));

      // Save the updated cart products
      await prefs.setStringList('cartProducts_$value', cartProducts);

      print(product);
      print('Added to Cart');

      // Calculate and update the total amount
      await updateCartTotal();
    } else {
      print('Product with the same ID already exists in the cart.');
    }
  }

  Future<void> removeProductFromCart({required String productID}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    List<String> cartProductJsons =
        prefs.getStringList('cartProducts_$token') ?? [];

    List<Map<String, dynamic>> cartProducts = [];
    for (String jsonStr in cartProductJsons) {
      Map<String, dynamic> product = json.decode(jsonStr);
      if (product['id'] != productID) {
        cartProducts.add(product);
      }
    }

    List<String> updatedCartProductJsons =
        cartProducts.map((product) => json.encode(product)).toList();
    print(updatedCartProductJsons);
    print('after deleted');
    await prefs.setStringList('cartProducts_$token', updatedCartProductJsons);

    // Calculate and update the total amount
    await updateCartTotal();
  }

  Future<double> updateCartTotal() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.getString(key) ?? '';

    // Retrieve the current cart products
    List<String> cartProducts =
        prefs.getStringList('cartProducts_$value') ?? [];

    // Calculate the total amount by summing up the product prices multiplied by their quantities
    double total = 0;
    for (String productJson in cartProducts) {
      Map<String, dynamic> product = json.decode(productJson);
      double productPrice = double.parse(product['Price']);
      int quantity = product['Quantity'];
      total += productPrice * quantity;
    }

    // Save the updated total amount in SharedPreferences
    await prefs.setDouble('cartTotal_$value', total);

    print('Cart total amount updated successfully');
    return total;
  }

  Future<List<Map<String, dynamic>>> getCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    List<String> cartProductJsons =
        prefs.getStringList('cartProducts_$token') ?? [];

    List<Map<String, dynamic>> cartProducts = [];
    for (String jsonStr in cartProductJsons) {
      Map<String, dynamic> map = json.decode(jsonStr);
      cartProducts.add(map);
    }
    print(cartProducts);
    return cartProducts;
  }

  Future<int> updateProductQuantity({
    required String productID,
    required int newQuantity,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.getString(key) ?? '';

    // Retrieve the current cart products
    List<String> cartProducts =
        prefs.getStringList('cartProducts_$value') ?? [];

    // Find the index of the product with the specified ID
    int productIndex = cartProducts.indexWhere((productJson) {
      Map<String, dynamic> product = json.decode(productJson);
      return product['id'] == productID;
    });

    if (productIndex != -1) {
      // Update the quantity of the product
      Map<String, dynamic> product = json.decode(cartProducts[productIndex]);
      product['Quantity'] = newQuantity;

      // Replace the product at the specified index with the updated product
      cartProducts[productIndex] = json.encode(product);

      // Save the updated cart products
      await prefs.setStringList('cartProducts_$value', cartProducts);

      print('Product quantity updated successfully');
      return newQuantity;
    } else {
      print('Product with the specified ID not found in the cart');
      return 0;
    }
  }

  Future<int> getProductQuantity({
    required String productID,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.getString(key) ?? '';

    // Retrieve the current cart products
    List<String> cartProducts =
        prefs.getStringList('cartProducts_$value') ?? [];

    // Find the index of the product with the specified ID
    int productIndex = cartProducts.indexWhere((productJson) {
      Map<String, dynamic> product = json.decode(productJson);
      return product['id'] == productID;
    });

    // Update the quantity of the product
    Map<String, dynamic> product = json.decode(cartProducts[productIndex]);

    // Replace the product at the specified index with the updated product
    cartProducts[productIndex] = json.encode(product);

    // Save the updated cart products
    await prefs.setStringList('cartProducts_$value', cartProducts);

    print('Product quantity updated successfully : ${product['Quantity']}');
    return product['Quantity'];
  }

  confirmOrder({required details}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    // Retrieve the cart products and their quantities
    List<Map<String, dynamic>> cartProducts = await getCartProducts();
    List<String> orderedProducts = [];
    List<int> amounts = [];

    // Extract the product IDs and quantities
    for (var product in cartProducts) {
      orderedProducts.add('${product['id']}');
      amounts.add(product['Quantity']);
    }

    Uri myUrl = Uri.parse("http://vzzoz.pythonanywhere.com/addorder");
    var response = await http.post(myUrl,
        headers: {
          'Authorization': 'token $value',
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: json.encode({
          "OrderedProducts": orderedProducts,
          "Amounts": amounts,
          "Location": details
        }));

    print(response.body); // Print the response body for debugging purposes

    var data = json.decode(response.body);
    success = data['success'];
    if(!success){
      print(data['message']);
    }
    print(success);
  }
}
