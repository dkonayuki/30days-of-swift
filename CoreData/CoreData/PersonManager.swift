//
//  PersonManager.swift
//  CoreDataTest
//
//  Created by dkonayuki on 3/28/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import Foundation
import CoreData

var personMgr: PersonManager = PersonManager()

class PersonManager: NSObject {
    var people = [NSManagedObject]()
}