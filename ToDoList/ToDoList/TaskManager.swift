//
//  TaskManager.swift
//  ToDoList
//
//  Created by dkonayuki on 3/28/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Name"
    var desc = "Description"
}

class TaskManager: NSObject {
    var tasks = [task]()
    func addTask(name: String, desc: String) {
        tasks.append(task(name: name, desc: desc))
    }
    
    func deleteTask(index: Int) {
        tasks.removeAtIndex(index)
    }
}
