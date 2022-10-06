# BBActors

You can get some information about Breaking Bad characters, episodes, and etc. also you can read some quotes by these characters.

Characters Tab:


https://user-images.githubusercontent.com/81614806/194431324-763937ed-bcca-4ad8-9b1e-32bda98673a9.MP4



# App Information:

Framework: SwiftUI
Compatibility: 
  iPhone 
  Requires iOS 15.0 or later
Architecture: MVVM
Dependencies: -
Device Orientation: Portrait
Time spent: ~8 hours
Features: 
  1. Custom Activity Indicator 
  2. Custom Animations
  3. Support of both dark and light Mode
  4. Load Images(thumbnail) with AsyncImage
  5. Refreshable Views
  6. Expandable Row for the episode tabview
  7. Random colors for the quotes tabview
  8. Custom Circle borders for the CharactersRow and it shows whether the character is alive or not
  9. Searchable List

# Notes

In SwiftUI, We can bind everthing! We can use @Binding for some types like Int, String and ... . If we want to bind the viewModel, We should use @StateObject for the first view and for the next views we have two choices: 1. we use @ObservedObject if we want to bind it for a few views، it's common to use @ObservedObject, 2. but if we want to bind and share it in many views we should use @EnvironmentObject. if we use this property wrapper we should add .environmentObject modifier for this view and also for the preview. if we don't use it, xcode won't shows the preview.

it's easy to use search bar on NavigationView. but we can only use List to have the .searchable modifier. it will be in iOS 16 and we can add .searchbale modifire to scrollView too. and also if we choose this way, sometimes we have a little bugs when we are working with the List.
So we can create custom search bar, but I used the nav search bar.

I did not add the unit test and UI test files because I have no knowledge about testing ios apps.
