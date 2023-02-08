# Flutter News 📰

A Flutter app that allows users to view the latest news from various countries using the [NewsAPI](https://newsapi.org).

## Features 📋

- Retrieve news from a variety of countries using the NewsAPI
- Display articles in a scrollable list

**Note:** Unfortunately, viewing the full story in a web view will not work on Android due to restrictions with CORS policies.

## Getting Started 🚀

To get started, simply clone or download the repository to your local machine. You will need to have [Flutter](https://flutter.dev/docs/get-started/install) installed.

## Usage 📖

In order to use the NewsAPI, you will need to sign up for an API key [here](https://newsapi.org/register). Once you have your API key, add it to the `article_repository.dart` file in the following line:
```dart
// TODO: Update this with your own API key
static const String \_apiKey = 'YOUR_API_KEY_HERE';
```
## License 📝
This project is licensed under the MIT License. Please see the [LICENSE](LICENSE) file for more details.