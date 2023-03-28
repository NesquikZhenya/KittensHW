//
//  TextInteractiveViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 19.07.2022.
//

import UIKit

class TextInteractiveViewController: UIViewController {
    
    @IBOutlet weak var lockingTextField: UITextField!
    @IBOutlet weak var lockingSwitch: UISwitch!
    @IBOutlet weak var uppercasedTextField: UITextField!
    @IBOutlet weak var lowercasedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First Item Second Screen"
        lockingSwitch.isOn = false
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(TextInteractiveViewController.didTapView))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
    @objc func didTapView() {
        self.view.endEditing(true)
    }

    @IBAction func thirdScreenButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "OpasityViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func lockingTextFieldDidChange(_ sender: Any) {
        if lockingTextField.text?.count ?? 0 > 0 {
            lockingSwitch.isEnabled = true
        } else {
            lockingSwitch.isEnabled = false
        }
    }
    
    @IBAction func lockingSwitchDidTap(_ sender: UISwitch) {
        if sender.isOn {
            lockingTextField.isUserInteractionEnabled = false
        } else {
            lockingTextField.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func uppercasedTextFieldDidChange(_ sender: Any) {
        uppercasedTextField.text = uppercasedTextField.text?.uppercased()
        lowercasedTextField.text = uppercasedTextField.text?.lowercased()
    }
    
    @IBAction func lockingTextFieldDoneDidTap(_ sender: UITextField) {
        sender.endEditing(true)
    }
    
    @IBAction func uppercasedTextFieldDoneDidTap(_ sender: UITextField) {
        sender.endEditing(true)
    }
}
