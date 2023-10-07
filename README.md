# SVProgressHUD-SwiftUI
SVProgressHUD_SwiftUI is a clean and easy-to-use HUD meant to display the progress of an ongoing task in SwiftUI apps

<img width="208" alt="Screenshot 2023-10-07 at 1 06 53 AM" src="https://github.com/JayantBadlani/SVProgressHUD-SwiftUI/assets/37996543/3ef9e2cb-d406-4c07-b7af-cbaf71812e06">
<img width="208" alt="Screenshot 2023-10-07 at 1 12 23 AM" src="https://github.com/JayantBadlani/SVProgressHUD-SwiftUI/assets/37996543/508f1093-0893-4d0c-91d1-76ed3239138b">

### Description
LoaderView is a SwiftUI component that provides a customizable loading indicator for your iOS app. It's designed to give you full control over the loader's appearance and behavior, making it easy to integrate and use in your SwiftUI projects. Similar to popular libraries like SVProgressHUD, LoaderView is entirely written in SwiftUI.

## Installation
To use LoaderView in your SwiftUI project, copy the `LoaderView.swift` file into your project directory and use this modifier.


```swift
    .loader(isShow: $isLoading)
```

## Usage
You can use LoaderView in your SwiftUI project in two different ways:

### Option 1: Using the `.loader` Modifier

```swift
import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Text("Hello, LoaderView!")
                .padding()
            
            Button("Show Loader") {
                isLoading.toggle()
            }
        }
        .loader(isShow: $isLoading, text: "Loading...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

### Option 2: Integrating LoaderView within a ZStack

```ruby
import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    var body: some View {
        ZStack {
            // Your content goes here
            Text("Welcome to My App")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            // Add LoaderView with desired customization
            if isLoading {
                LoaderView(text: "Loading...", userInteractionEnable: true, backgroundColor: .white, tintColor: .blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```



## Customize LoaderView properties as needed:

### text: 
An optional string to display a loading message.

### userInteractionEnable: 
A boolean to enable or disable user interaction while the loader is visible.

### backgroundColor: 
The background color of the loader (default is .white).

### tintColor: 
The color of the loader's animated circle (default is .black).

Feel free to customize and enhance LoaderView according to your specific use case, and enjoy its user-friendly features in your SwiftUI app!

## Requirements
iOS 
Xcode 
Swift

##  Contributions
We welcome contributions and suggestions from the community. If you encounter issues or have ideas for improvements, please feel free to open an issue or create a pull request.

## Author
Jayant Badlani

## Acknowledgments
This LoaderView component was developed to provide a customizable loading indicator for SwiftUI applications, enhancing user experience during asynchronous tasks.
