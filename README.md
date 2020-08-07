# Dart Commons

Dart Commons is a Package that provides a punch of useful extension methods for every application functionalities (Inspired by Anko Commons in Kotlin)
this package will help you save some lines of code and make it easy to do repeated operations throughout your applications

## Getting Started

First, add `dart_commons` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
### iOS

## If You Will Use The Call Function  
Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

```
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>tel</string>
</array>
```

### Android

No configuration required - the plugin should work out of the box.


### Prerequisites

This Package Works on Dart >=2.7.0 make sure tou upgrade Your Sdk

```
sdk: ">=2.7.0 <3.0.0"
```

### How To Use

## Logging

Logging Uses the `logging` package so you nedd to add this in the start of your application

```
void main() {
  runApp(MyApp());
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
```
you can use the logging as follows

```
    16.0.log();
    16.log(className: 'ClassName');
    'error'.logError();
    'Info'.log();
```

## SnackBar
snack bars can be shown on String and On BuildContext
 `duration` param is optional
 
```
// If you called show snack bar on context you need to provide the text  
    context.ShowSnackBar('text',
        duration: Duration(milliseconds: 500));
// If you called show snack bar on string you need to provide the build context  
        'this is example'.ShowSnackBar(context,duration: Duration(milliseconds: 500));
```

And repeat

```
until finished
```

## Built With

* [Flutter](http://www.flutter.dev/) - The web framework used

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

