# AutoHideKeyboardControllers

## Description
AutoHideKeyboardControllers is a set of UIViewController subclasses which enables the tap background to hide keyboard behavior.

## Contents
Currently there are two classes available:

1. AutoHideKeyboardViewController
2. AutoHideKeyboardTableViewController

## Usage
There are only 2 steps to make your viewcontroller hide keyboard on background tapped.

**Step 1**: Make your viewcontroller a subclass of AutoHideKeyboardViewController/AutoHideKeybaordTableViewController instead of UIViewController/UITableViewController

	#import "AutoHideKeyboardViewController.h"
	
	@interface ViewController : AutoHideKeyboardViewController
	
**Step 2**: If you have any UITextView or UITextField in your page, set their delegate to your viewcontroller.

That's it! Enjoy!

---


# License

UIKitHelper is available under the MIT license. See the LICENSE file for more info.