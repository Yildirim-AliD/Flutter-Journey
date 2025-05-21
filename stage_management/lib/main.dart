import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stage_management/count_controller.dart';
import 'package:stage_management/random_number_controller.dart';

void main() {
  Get.put(NumberController());
  runApp(const MyApp());
  //simple state --> setState -->update
  //reactive --> obx -->getx
  //getbuiilder < getx < obx widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  //Put adds to the widget tree,find is used to find it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Usage of Getx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            GetBuilder(
              init: CountController(),
              builder:
                  (controller) => Text(
                    controller.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
            ),
            SizedBox(height: 8),
            const Text("Random Numbers"),
            Obx(
              () => Text(
                Get.find<NumberController>().randomNumber.value.toString(),
              ),
            ),
            SizedBox(height: 3),
            Obx(() {
              var c = Get.find<NumberController>();
              return Text(c.randomNumber.value.toString());
            }),
            SizedBox(height: 3),
            GetX<NumberController>(
              builder:
                  (controller) =>
                      Text(controller.randomNumber.value.toString()),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyFloatingActionButton(),
          SizedBox(height: 10),
          RandomNumberButton(),
        ],
      ),
    );
  }
}

class RandomNumberButton extends GetView<NumberController> {
  const RandomNumberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //Get.find<NumberController>().randomNumber();
        controller.randomGenerator();
      },
      child: Icon(Icons.refresh),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    //CountController controller = Get.find();
    //var controller  = Get.find<CountController>();
    return GetBuilder<CountController>(
      builder:
          (controller) => FloatingActionButton(
            onPressed: () {
              controller.increase();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
    );
  }
}
