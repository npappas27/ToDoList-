//
//  Item.swift
//  ToDoList
//
//  Created by Nick Pappas on 11/1/18.
//  Copyright © 2018 Nick Pappas. All rights reserved.
//

import Foundation


class Item : Encodable, Decodable {
    var title : String = ""
    var done : Bool = false

}
