# ViperArch

![Swift+VIPER](https://user-images.githubusercontent.com/55566616/222008826-3ced2770-26d6-42ef-8016-ce4da7eb2711.png)

ViperArch is a sample iOS project that demonstrates the implementation of the VIPER architecture using Swift and the Alamofire framework. 

## About VIPER

VIPER is a design pattern that stands for View, Interactor, Presenter, Entity, and Router. It's an alternative to the traditional MVC pattern that aims to make your code more modular, testable, and maintainable.

VIPER is particularly useful for large-scale projects, as it separates your code into distinct modules that are easier to understand and modify. Each module has a specific responsibility, and the boundaries between modules are clearly defined, making it easier to collaborate with other developers.

## Architecture Overview

The ViperArch project consists of the following components, each located in its own folder:

- `Model`: contains the `Post` struct, which conforms to the `Codable` protocol and represents a post retrieved from a remote API.

- `View`: contains the `PostsViewController` class, which is a `UIViewController` subclass that displays a list of posts retrieved from the remote API. The view also contains a `PostsHeaderView` class that displays a header for each section of posts, with the user ID of the author of the posts.

- `Interactor`: contains the `PostsInteractorImpl` class, which is responsible for retrieving posts from the remote API using the `APIService` protocol.

- `Presenter`: contains the `PostsPresenterImpl` class, which acts as an intermediary between the view and the interactor. The presenter retrieves posts from the interactor and provides them to the view for display. The presenter also computes the number of sections and number of posts in each section based on the user ID of the post authors.

- `Router`: contains the `PostsRouterImpl` class, which sets up the VIPER components and provides the entry point for the VIPER module.

- `Service`: contains the `APIService` protocol and `APIServiceImpl` class, which provide the implementation for fetching posts from the remote API using Alamofire.

## Demo

![ViperArch - Demo](https://user-images.githubusercontent.com/55566616/222009014-dac857f8-400d-4b2f-be32-04fb46c1151b.gif)

To see ViperArch in action, simply open the `ViperArch.xcodeproj` file in Xcode and build and run the project. The main view of the app displays a list of posts retrieved from the remote API. Each section of posts is grouped by the user ID of the post authors.

## Requirements

- Xcode 12 or later
- iOS 13 or later

## Dependencies

- Alamofire: A Swift-based HTTP networking library for iOS and macOS.

## License

ViperArch is released under the MIT license. See [LICENSE](LICENSE) for details.

## Contributions

Contributions are welcome! If you have any suggestions or issues with the code, please feel free to create a pull request or issue on GitHub. Thank you!
