import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  home:const Home()));
class Controller extends GetxController{
var count = 0.obs;
increment() => count++;
decrement() => count--;

}
class Home extends StatelessWidget{
  const Home({super.key});
@override
Widget build(context){
final Controller c = Get.put(Controller());
return Scaffold(
 appBar:AppBar(title: Center(
  child: Obx(() => Text("Clicks: ${c.count}")))),
body: Center(
child:Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
  Obx(()=>Text("Clicks: ${c.count}")),
  const SizedBox(height: 20),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        child: const Text("Add"),
        onPressed: c.increment,
      ),
      const SizedBox(width: 20),
      ElevatedButton(
        child: const Text("Subs"),
        onPressed: c.decrement,
      ),
      const SizedBox(width: 20),
      ElevatedButton(
        child: const Text("reset"),
        onPressed:(){},
      ),
    ],
  ),
],
),

),
floatingActionButton: FloatingActionButton(
child: Icon(Icons.route),
onPressed: ()=> Get.to( Other()),
),
);
}
}
class Other extends StatelessWidget{
 Other({super.key});
final Controller c = Get.find();
@override
  Widget build(BuildContext context){
     // Access the updated count variable
     return Scaffold(
      appBar: AppBar(title:const Center(child: Text("Second"))),
      body: Center(child: Obx(()=>Text("Clicks: ${c.count}")),));
  }
}
