[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

<img src="https://assets.edgeangel.co/app-firebase-gtm-adjust-flutter.png" width="400">

# Firebase, GTM and Adjust with Flutter
🔥 Flutter sample app with Firebase, GTM and Adjust

## How to 
* Update your ADJUST_APP_TOKEN in main.dart
* iOS: add your Firebase GoogleService-Info.plist config file to the Xcode project
* iOS: add [GTM for iOS via CocoaPods](https://developers.google.com/tag-platform/tag-manager/ios/v5#1_add_tag_manager_to_your_project) 
* iOS: import the [GTM iOS configuration](https://assets.edgeangel.co/GTM_config.json) to your container and update your ADJUST_EVENT_TOKEN in the AdjustEventTag
* iOS: submit a new version for the container, download the version and add the GTM-XXX.json file into the /ios/container folder
* Build and run

<img src="https://assets.edgeangel.co/app-firebase-gtm-adjust-flutter-mockup.png" width="800">

## Details
* Send test_event: event sent to Firebase with a Modify Event tag in GTM in order to send custom parameters (based on Event Parameter variables and Function Call variables)
* Send adjust_test_event: event collect with Firebase Analytics and sent to Adjust with a Function Call tag triggering the Adjust native trackEvent() method

## Resources
* Flutter: https://docs.flutter.dev/get-started 
* Firebase with Flutter: https://firebase.google.com/docs/flutter/setup?platform=ios 
* Firebase Analytics with Flutter: https://firebase.google.com/docs/analytics/get-started?platform=flutter 
* Google Tag Manager - iOS SDK: https://developers.google.com/tag-platform/tag-manager/ios/v5
* Google Tag Manager - Advanced iOS Tag Manager configuration: https://developers.google.com/tag-platform/tag-manager/ios/v5/advanced-config 
* Adjust - Flutter SDK: https://help.adjust.com/en/article/get-started-flutter-sdk

## More information and contribution
💌 hello@edgeangel.co

## License
The contents of this repository is licensed under the GPL-3.0 license. See [LICENSE](LICENSE) for more information.