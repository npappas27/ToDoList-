//
//  Item.swift
//  ToDoList
//
//  Created by Nick Pappas on 11/15/18.
//  Copyright © 2018 Nick Pappas. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    @objc dynamic var dateCreated : Date?
}
