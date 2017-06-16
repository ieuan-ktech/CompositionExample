# Composition Example

An example of composition using protocols. The idea is that every component does all their communication via protocols and dependancy injection. Each component becomes independent, replaceable, and testable. Each component is buildable by separate people without conflicts.

Whilst it may look like a lot of files are created it should stop people from complaining that their `View Controller` is massive. You can put all the files into one file but these are separated to enforce the component part of composition.

## Project Structure
The project is split into different groups:
- **UICategories** - categories for UI classes
- **Data Categories** - categories for classes that are not UI
- **API** - Place for the API Router and API Manager
- **Model** - Model items
- **SharedComponents** - Components that are shared between scenes
- **Scenes** - A Scene is anything related to a single screen that isn't shared between scenes
A `Root View Controller` is used to control the flow of `Scenes` when the app becomes active.

## Composition Dos and Don'ts
- Components must always be completely independent from each other and communicate only via protocols
- Avoid retain cycles, use your brain.

## Scene Compositor
**The central point where scenes are composited.** All scenes should be composited here to keep things organised and reduce the amount of unpredictability and bugs.

## Scene Protocol files
Separate files containing all the protocols required for a `Scene` to be composited.

## Key Components
Each component conforms to a protocol and may have references to other protocols to work

#### API Router
Needs `Alamofire` to work. If you wish not to use `Alamofire` then you can make your own `APIRouter` and follow the structure.
An enum containing the API end points. Also included are methods to get the end point as a URLRequest. 
This file is sectioned into:
- **API End Point** - the cases for the enum. Some require parameters for the end point to work
- **HTTP Types** - returns an HTTP Method associated with the given end point
- **API Path** - the path of the end point
- **Parameters** - if parameters are required then here is where you create them as a `Dictionary`
- **URL Request** - Creates a URL request

#### APIManager Component
Needs `Alamofire` to work. If you wish not to use `Alamofire` then you can make your own `APIManager` and follow the structure.
A singleton class with multiple extensions conforming to API protocols. API protocols are defined elsewhere. The extensions implement the protocols and transform responses into non-Alamofire specific classes.

#### View Controller Component
The `View Controller` is the main body to which components are plugged into. It controls the view life cycle and can call methods on the plugged in components if need be.

#### Router Component
The `Router` contains methods for navigation. This is where `View Controllers` can be pulled out from the `Scene Compositor` for use with scene transitions.

#### UI Component
The `UI` object contains references to **all** UI related to the scene. 
**If using code to create and layout UI** then this is where you do it. e.g., `LoginUI` has a method 
```swift
setupUIOn(view:)
```
which sets up the UI and layout when called by the `LoginViewController` `viewDidLoad` method.
**If using storyboard or xibs to create and layout UI** then you must add this component as an object and hook up the UI. e.g., `HomeUI` is an object in the `HomeViewController` scene with references to the UI

#### UI Actions Component
The `UI Actions` object contains the actions for the UI. 
**If using storyboard or xibs to create and layout UI** then you must add this component as an object and hook up the actions.
**side note:**
In the code when LoginUIActions is assigned an object that conforms to LoginUIProtocol it sets itself up to listen for when the UI changes so it can add it's actions to that UI

