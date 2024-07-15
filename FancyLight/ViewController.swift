//
//  ViewController.swift
//  FancyLight
//
//  Created by Brian Foutty on 5/14/24.
//  See teaching steps descriptions at the bottom of the file
//

import UIKit

class ViewController: UIViewController {
    
    // #1 - add enum
    enum ScreenColor {
            case white, red, blue, green
        }
    
    // MARK: - IB Outlets
    @IBOutlet weak var lightButton: UIButton!
    
    // MARK: - Instance Properties
    var lightOn = true
    // #2 - add "counter" property
    var counter = 0

    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        // #9 - style the button (slightly)
        lightButton.layer.borderWidth = 0.5
        lightButton.layer.borderColor = UIColor.lightGray.cgColor
        lightButton.layer.cornerRadius = 22
        
        updateUI()
    }
    
    // MARK: - IB Actions
    @IBAction func lightButtonTapped(_ sender: Any) {
        //lightOn = !lightOn
        lightOn.toggle()
        updateUI()
    }
    
    // #5 - add a left or right swipe gesture from the Object Library
    // #6 - CTRL-drag in the Assistant Editor to connect the action to the ViewController
    @IBAction func swipeToChangeColor(_ sender: UISwipeGestureRecognizer) {
        // #7 - increment the counter property
        counter += 1
        // #8 - call this method
        counterAssignsColor()
        
    }
    
    // MARK: - Instance Methods
    // Note - I leave these enabled for this version of the app so that there is not a conflict between the swip gesture and an On/Off button tap.
    func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            lightButton.setTitle("Off", for: .normal)
            lightButton.setTitleColor(.black, for: .normal)
        } else {
            view.backgroundColor = .black
            lightButton.setTitle("On", for: .normal)
            lightButton.setTitleColor(.white, for: .normal)
        }
    }
    
    // #3 - add this switch statement
    func swipeToUpdateUI(toColor screenColor: ScreenColor) {
            switch screenColor {
            case .white:
                view.backgroundColor = .white
            case .red:
                view.backgroundColor = .red
            case .blue:
                view.backgroundColor = .blue
            case .green:
                view.backgroundColor = .green
            }
        }
        
        // #4 - add this function
        func counterAssignsColor() {
            switch counter {
            case 1:
                swipeToUpdateUI(toColor: .red)
            case 2:
                swipeToUpdateUI(toColor: .blue)
            case 3:
                swipeToUpdateUI(toColor: .green)
            default:
                counter = 0 // this line forces the loop of colors by reassigning the counter property to 0 from 3.
                swipeToUpdateUI(toColor: .white)
            }
        }
}

// #1 - add enum at the top of the class. This can be done in a separate Swift file as part of a data model. I chose not to do that in this project since this just needs the enum and not more functionality.
// #2 - add a counter property to enable looping through colors with swipe gesture.
// #3 - add this switch statement to assign a screen color with the same name for each background color. Notice the name of the argument label. Name chosen specifically to improve readability in counterAssignsColor() function.
// #4 - add this function. This function assigns property value to the counter variable and the background screen color for each int value. As soon as the light is turned on the default case of 0 occurs.
// #5 - add a left or right swipe gesture from the Object Library
// #6 - CTRL-drag in the Assistant Editor to connect the action to the ViewController
// #7 - increment the counter property to so that each swipe will invoke a different case in the switch statement in the counterAssignsColor() method.
// #8 - call the counterAssignsColor() method in the swipeGetureRecognizer action.
// #9 - style the button (just slightly)
// #10 - Build, run, and test your app. Enjoy!!
