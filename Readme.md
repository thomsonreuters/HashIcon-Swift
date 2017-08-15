# HashIcon - Swift Library

## Overview
* Swift library which takes in a string and draws a pictorial representation of that string.

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

# Developing

If you have discover any issues with regards to this project, please feel free to create an Issue.

If you have coding suggestions that you would like to provide for review, please create a Pull Request.

We will review issues and pull requests to determine any appropriate changes.

# Contributing
In the event you would like to contribute to this repository, it is required that you read and sign the following:

* Individual Contributor License Agreement.pdf
* Entity Contributor License Agreement.pdf

Please email a signed and scanned copy to `sdkagreement@thomsonreuters.com`. If you require that a signed agreement has to be physically mailed to us, please email the request for a mailing address and we will get back to you on where you can send the signed documents.

# Roadmap
* No further development expected

