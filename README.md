# Darty Commons

Darty Commons is a Package that provides a punch of useful extension methods for every application functionalities (Inspired by Anko Commons in Kotlin)
this package will help you save some lines of code and make it easy to do repeated operations throughout your applications

## Getting Started

First, add `dart_commons` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
### iOS

### Android

No configuration required - the plugin should work out of the box.


### Prerequisites

This Package Works on Dart >=2.12.0 make sure to upgrade Your Sdk

```
sdk: ">=2.12.0 <3.0.0"
```

### How To Use

# Logging

Logging Uses the `logging` package so you need to add this in the start of your application

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
    16.log(tag: 'ClassName');
    'error'.logError(error: 'error', stackTrace: StackTrace.current);
    'Info'.log();
    true.log();
    context.log('message');
```

# SnackBar
snack bars can be shown on String and On BuildContext
 `duration` param is optional 
also you can customize the snack bar by passing `backgroundColor`,`TextStyle`,`TextDirection` params

```
// If you called show snack bar on context you need to provide the text  
    context.showSnackBar('text',
        duration: Duration(milliseconds: 500));
// If you called show snack bar on string you need to provide the build context  
        'this is example'.showSnackBar(context,duration: Duration(milliseconds: 500));
        
// or you can use show Error snack bar for handling error messages
     context.showErrorSnackBar('text',
        duration: Duration(milliseconds: 500));    
```

# String Commons

## Dial 
dial opens the dial app with number in place without direct call
```
 '+20123456789'.dial();
```


## ToInt , ToDouble

converts string to int and to double directly 
```
'90'.toInt;
'90'.toDouble;
```
## Email

Send Email with the String as the email body 
```
    'this email body'
        .email('test@gmail.com', subject: 'test email function');
```

## Browse
open link in browser
```
'https://www.flutter.dev'.browse();
```

## Share
Share Passed Text

```
'this share body'.share(subject: 'subject');
```

## Send whatsApp Message
Send WhatsApp Message With the passed String as Message Body

```
    'Send Whats App Message With the passed String as Message Body'
        .sendWhatsAppMessage(phone: '+2011111111');
```

# toBase64
to base64 methods return base64 representation of a file 

```
 File file = File(path);
 String base64 =file.toBase64;   
```

you can also get base64 from file path
```
String base64 =path.toBase64;
```

# Delay
you can call delay on any `Int` number and select which value to delay with

```
16.delay(milliseconds: true);
```
# List Commons

## AddOrReplace
Add value to list if doesn't exist else replace Current Value
```
List<int> list = [10, 11, 15];
    list.addOrReplace(10);
```
## Replace
Set Value At index
```
// (index,value)
List<int> list = [10, 11, 15];
    list.replace(1, 9);
```

# Built With

* [Flutter](https://www.flutter.dev/) - the framework built for

# Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

# Authors

* **Ahmed Beheiri** - *Initial work* - [DartCommons](https://github.com/AhmedBeheiri/dart_commons)

See also the list of [contributors](https://github.com/AhmedBeheiri/dart_commons/graphs/contributors) who participated in this project.

# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

# Acknowledgments
 this package uses 
* [logging](https://pub.dev/packages/logging)
* [url_launcher](https://pub.dev/packages/url_launcher)
* [share_plus](https://pub.dev/packages/share_plus)

