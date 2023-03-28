//
//  HandmadeViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 23.07.2022.
//

import UIKit

class HandmadeViewController: UIViewController {
    
    weak var delegate: (NameReceiving)?

    var name: String = ""
    
    override func loadView() {
        view = HandmadeView()
        self.delegate = (view as? HandmadeView)
        delegate?.updateName(name: name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
