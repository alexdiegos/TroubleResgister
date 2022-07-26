//
//  UIViewController+Context.swift
//  TroubleRegister
//
//  Created by Alexandre Silva on 26/07/22.
//  Copyright © 2022 AlexDiegoS. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
