# SwiftUISidebarSelectionBug

NavigationView resets its currently selected navigation link in the sidebar mode when open a inner NavigationLink as a detail view.
The issue happens only on iPad/MacCatalyst and not on iOS.
This breaks the logic of saving a last opened item.


https://user-images.githubusercontent.com/63708833/168762918-9d9e79ed-0d5e-49ff-a0fb-05760cf74e71.mov

