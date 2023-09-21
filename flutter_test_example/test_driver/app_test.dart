import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Flutter add app test", () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    var textField1 = find.byValueKey("TextField1");
    var textField2 = find.byValueKey("TextField2");
    var button = find.text("Calculate");
    var result = find.text("15");

    test("add numbers", () async {
      await Future.delayed(const Duration(seconds: 2));
      await driver!.tap(textField1);
      await driver!.enterText("5");
      await driver!.tap(textField2);
      await driver!.enterText("10");
      await driver!.waitForAbsent(result);
      await driver!.tap(button);
      await driver!.waitFor(result);
      await driver!.waitUntilNoTransientCallbacks();
    });
  });
}
