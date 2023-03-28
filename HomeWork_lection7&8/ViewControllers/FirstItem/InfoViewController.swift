//
//  ViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 18.07.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.placeholder = "Starting from 9"
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(InfoViewController.didTapView))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
    @objc func didTapView() {
        self.view.endEditing(true)
    }

    @IBAction func secondScreenButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "TextInteractiveViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func phoneNuberTextFieldIsGoingToChange(_ sender: Any) {
        if phoneNumberTextField.text?.count ?? 0 < 3 {
            phoneNumberTextField.text = "+7"
        }
    }
    
    private let numbers: Set<Character> = ["+","0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    @IBAction func phoneNumberTextFieldChanged(_ sender: Any) {
        //если строка пустая делается +7 вначале, типо только RU номера
        if phoneNumberTextField.text?.count ?? 0 < 3 {
            phoneNumberTextField.text = "+7"
        // далее проверяется что пишутся только цифры, буквы тутже обрезает, также обрезает только 12 символов
        } else if Set(phoneNumberTextField.text ?? "").isSubset(of: numbers) {
            phoneNumberTextField.text = String((phoneNumberTextField.text ?? "").prefix(12))
        } else {
            phoneNumberTextField.text = String((phoneNumberTextField.text ?? "").prefix((phoneNumberTextField.text?.count ?? 1) - 1))
        }
    
    }
}

