//
//  HeightReceiving.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 23.07.2022.
//

import Foundation

protocol HeightReceiving: AnyObject {
    func updateHeight(height: String, unit: String)
}

protocol NameReceiving: AnyObject {
    func updateName(name:String)
}
