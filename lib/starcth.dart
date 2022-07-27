// This example shows how *not* to write asynchronous Dart code.
import 'dart:io';
import 'dart:async';

String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow.
  String res = '';
  return Future.delayed(Duration(seconds: 2), () {
    res = 'Large Latte';
    return res;
  });
}

Future createOrderMessage1() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder1() {
  // Imagine that this function is more complex and slow.
  String res = '';
  return Future.delayed(Duration(seconds: 2), () {
    res = 'Large Latte';
    return res;
  });
}

Future main() async {
  print("with out async and wait");
  print("sheikh is buying coffee");
  print(createOrderMessage());
  print("sheikh checking insta,fb,bored ....");
  print("with  async and wait");
  print("sheikh is buying coffee");
  print(await createOrderMessage1());
  print("sheikh checking insta,fb,bored ....");
}
