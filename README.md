# AmazingCommand

`AmazingCommand` is a spin on classic [`Command`](https://en.wikipedia.org/wiki/Command_pattern) design pattern with a Swift version of [`Target-Action`](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html) design pattern on top. Together they will enable you to create commands with ease, without unnecessary repetition and no chances of accidentally creating a retencion cycle.

## Why?

Let's say that you are developing financial application and you have `Command` pattern already applied. And it works fine for global commands like `Transfer` and `Deposit`. But now you want to create a command `Export` that is specific to one of the application's screens. What do you do? You create a class that implements your command protocol. And here is where the problem arise. You just created a separate class for a command that is tightly coupled with one of many screens in the application. That's where `AmazingCommand` comes to rescue.

## Usage

```swift
import AmazingCommand

class ExportViewModel {
    
    var exportCommand: AmazingCommand<ExportViewModel, IndexPath>!
    
    init() {
        exportCommand = AmazingCommand(target: self,
                                       executeFunction: ExportViewModel.export,
                                       canExecuteFunction: ExportViewModel.canExport)
    }
    
    func export(_ parameter: IndexPath) {
        // ...
    }
    
    func canExport(_ parameter: IndexPath) -> Bool {
        let canExport = true
        
        // ...
        
        return canExport
    }
}


class ExportViewController: UIViewController, UITableViewDelegate {
    
    let viewModel = ExportViewModel()
    
    // ...
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.exportCommand.execute(indexPath)
    }
    
    // ...
}
```

## Requirements

- macOS 10.14+
- iOS 11.0+
- tvOS 11.0+
- watchOS 4.0+
- Xcode 11+
- Swift 5.0+

## Installation

### Swift Package Manager

To integrate `AmazingCommand` into your Xcode project using [Swift Package Manager](https://swift.org/package-manager/), specify it as dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/khamitimur/AmazingCommand.git", .upToNextMajor(from: "1.0.0"))
]
```

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

* Any similarities with the [`DelegateCommand`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.platformui.delegatecommand) are deliberate.
* Implemenation of [`Target-Action`](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html) design pattern in Swift was inspired by [the article](https://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/) by [Ole Begemann](https://oleb.net/).
