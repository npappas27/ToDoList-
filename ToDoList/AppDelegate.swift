//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Nick Pappas on 11/1/18.
//  Copyright © 2018 Nick Pappas. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
        do {
            _ = try Realm()

        }catch {
            print("error initializing new realm \(error)")
        }

        
        return true
    }
}




