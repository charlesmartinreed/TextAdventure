//
//  Helper.swift
//  TextAdventure
//
//  Created by Charles Martin Reed on 8/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import Foundation
//Class is responsible for getting the user input from the console

func getUserInput() -> String {
    let standardInput = FileHandle.standardInput
    //take the data held within the standard input and encode it as UTF8
    var input = NSString(data: standardInput.availableData, encoding: String.Encoding.utf8.rawValue)
    
    input = input!.trimmingCharacters(in: CharacterSet.newlines) as NSString
    
    return input! as String
}
