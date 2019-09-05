# Facebook Login

## About

The app features login with Facebook, showing most important user information.

It was taken into consideration the overall architecture and code organization. The code is kept clean with a scalable and easy-to-maintain structure.

It was developed with the latest XCode and iOS, and it's easily upgraded to the upcoming versions of the tool and OS.

## Requirements

- iOS 12+
- Swift 5.0

## Features

- Allow login with facebook
- Remember last session using Realm database
- Shows most important user information in a UITableView
- Allows logout (wipes database)

## Structure

App is devided in 5 base folders:

- **Modules:** Where all UI components are located (Login/Profile).
- **Library:** App logic, components, extensions, models and managers.
- **Assets:** Assets such as images, fonts, etc.
- **Localizations:** App translation files.
- **Supporting Files:** App delegate and other supporting files.

## Design Patterns

- **MVVM:** Used in profile, to provide information to the UI. Separated in 2 files, ViewModel and  DataSource. The first provides the Information and the last one feeds the TableView.
- **Delegates:** Being used mostly in Profile UI by the DataSource file to handle interaction with the ViewController.
- **Singletons:** Used as single instance of Managers.
- **Coordinator:** Not the standard implementation of Coordinators, but this will be responsible for routing from one screen to the other.

## Tests

Covered most relevant portion of the code with the following tests

- **Unit Tests:** They are located together with their respective classes for better maintainance and readability. (ProfileDataSourceTests, TimeManagerTests, UserTests)
- **UI Tests:** Located under FacebookLoginUITests. Testing the main flow of login and logout.
