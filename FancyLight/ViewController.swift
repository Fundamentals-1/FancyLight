//
//  ViewController.swift
//  FancyLight
//
//  Created by Brian Foutty on 5/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum ScreenColor {
            case white, red, blue, green
        }
    
    // MARK: - IB Outlets
    @IBOutlet weak var lightButton: UIButton!
    
    // MARK: - Instance Properties
    var lightOn = true
    var counter = 0

    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightButton.layer.borderWidth = 0.5
        //lightButton.layer.borderColor = UIColor(cgColor: )
        lightButton.layer.cornerRadius = 22
        updateUI()
    }
    
    // MARK: - IB Actions
    @IBAction func lightButtonTapped(_ sender: Any) {
        //lightOn = !lightOn
        lightOn.toggle()
        updateUI()
    }
    
    @IBAction func swipeToChangeColor(_ sender: UISwipeGestureRecognizer) {
        counter += 1
        counterAssignsColor()
        
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
    
    func swipeToUpdateUI(forColor screenColor: ScreenColor) {
    
            switch screenColor {
            case .white:
                view.backgroundColor = .white
            case .red:
                view.backgroundColor = .red
            case .blue:
                view.backgroundColor = .blue
            case .green:
                view.backgroundColor = .green
//            case .black:
//                view.backgroundColor = .black
            }
        }
        
        func counterAssignsColor() {
            switch counter {
            //case 0:
                //swipeToUpdateUI(forColor: .white)
            case 1:
                swipeToUpdateUI(forColor: .red)
            case 2:
                swipeToUpdateUI(forColor: .blue)
            case 3:
                swipeToUpdateUI(forColor: .green)
//            case 4:
//                swipeToUpdateUI(forColor: .black)
            default:
                counter = 0
                swipeToUpdateUI(forColor: .white)
            }
        }
}

