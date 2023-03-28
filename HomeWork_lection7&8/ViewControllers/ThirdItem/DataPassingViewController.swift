//
//  DataPassingViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 23.07.2022.
//

import UIKit

class DataPassingViewController: UIViewController {

    var name: String = ""
    var unit: String = "cm"
    var height: String = ""
    var delegate: HeightReceiving?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(name)!"
        
    }
    
    @IBAction func unitSegmentedControlChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex != 0 {
            unit = "ft"
        } else {
            unit = "cm"
        }
    }
    
    @IBAction func heightTextFieldDoneButtonDidTap(_ sender: UITextField) {
        sender.endEditing(true)
    }
    
    @IBAction func heightTextFieldEditingChanged(_ sender: UITextField) {
        if sender.text != nil {
            backButton.isHidden = false
            self.height = sender.text!
        }

    }
    
    @IBAction func backNuttonDidTap(_ sender: UIButton) {
        delegate?.updateHeight(height: height, unit: unit)
        dismiss(animated: true)
    }
    
}
