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
    let items = List<Item>()
}
