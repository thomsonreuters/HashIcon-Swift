# HashIcon - Swift Library

## Overview
* JS library which takes in a string and draws a pictorial representation of that string
* The same string will generate the same image in [HashIcon-JS](https://github.com/thomsonreuters/HashIcon-JS)
* Can be shown to a user in order verify that data (e.g. a public key) is identical in 2 applications

![Example Ouput](./output.png)


## Contact
[Francisco Pereira](mailto:francisco.pereira@thomsonreuters.com) - [The Hub](https://thehub.thomsonreuters.com/people/0169361) - [Git](https://git.sami.int.thomsonreuters.com/francisco.pereira)

## Requirements

- iOS 9.0+ 
- Xcode 8.0+

## Usage

* Include the library (require, import)
* Draw the image - ```HashIcon(size: 5).drawIcon(input: "Example", container: view)```


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build HashIconSwift 1.0.0+.

To integrate HashIconSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'HashIconSwift', :git => 'git@git.sami.int.thomsonreuters.com:nopass/hashicon-swift.git'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate HashIconSwift into your project manually.

#### Git Submodules

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add HashIconSwift as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add git@git.sami.int.thomsonreuters.com:nopass/hashicon-swift.git
$ git submodule update --init --recursive
```

- Open the new `HashIconSwift` folder, and drag the `HashIconSwift.xcodeproj` into the Project Navigator of your application's Xcode project.

> It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `HashIconSwift.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `HashIconSwift.xcodeproj` folders each with two different versions of the `HashIconSwift.framework` nested inside a `Products` folder.

> It does not matter which `Products` folder you choose from.

- Select the `HashIconSwift.framework`.

- And that's it!

> The `HashIconSwift.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

#### Embeded Binaries

- Download the latest release from https://github.com/Thomson Reuters/HashIconSwift/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `HashIconSwift.framework`.
- And that's it!

# Contributing
## Got a question or problem?

The best way to contact us is to open an issue on GitHub. We will be monitoring these and will respond as soon as we can.

## Found a bug?

If you found a bug in the code you can help us in one of two ways:

* Open a bug report issue on GitHub
* Fix the bug and submit a Pull Request (please follow the below guidelines)

## Missing a feature?

If there is a feature you think should be in this library, you can help in one of two ways:

* Open an issue in GitHub and request the feature
* Implement the feature and submit a Pull Request (please follow the below guidelines)

## Submitting a Pull Request

If you would like to submit a Pull Request (bug fix of new feature) to this repo, please consider the below points:

* You will need to read and sign the Contributer License Agreement
  * If you are an Individual: Individual Contributor License Agreement.pdf
  * If you are a corporation: Entity Contributor License Agreement.pdf
  * Please print, sign, scan and send the scanned copy to `sdkagreement@thomsonreuters.com`
* Please do your code change in a new branch and then submit a Pull Request into master
* Please attempt to fit in with the current code standard in the repo
* Please make your commit messages meaningful
* Please make sure all the tests run and pass before submitting the Pull Request
* Please add any new tests to cover the bug or feature
* After the Pull Request is merged to master, please delete your branch

# Roadmap
* No further development expected

