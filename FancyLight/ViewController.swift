//
//  ViewController.swift
//  FancyLight
//
//  Created by Brian Foutty on 5/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var lightButton: UIButton!
    
    // MARK: - Instance Properties
    var lightOn = true

    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - IB Actions
    @IBAction func lightButtonTapped(_ sender: Any) {
        // Note: I initally use the next line to change the state of the lightOn property. We change to use the lightOn.toggle() method after the testing the app's functionality so that I can reinforce the concept of using built-in methods as being the best, most memory efficient for any platfrom.
        //lightOn = !lightOn
        lightOn.toggle()
        updateUI()
    }
    
    
    // MARK: - Instance Methods
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
}

