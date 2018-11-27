//
//  Category.swift
//  ToDoList
//
//  Created by Nick Pappas on 11/15/18.
//  Copyright © 2018 Nick Pappas. All rights reserved.
//

import Foundation
import RealmSwift


class Category : Object {
    @objc dynamic var name:String = ""
    @objc dynamic var colorHex : String = "#8E725E"
    let items = List<Item>()

}
