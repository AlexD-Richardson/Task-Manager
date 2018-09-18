//
//  Edit Task Manager.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/17/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class editTaskManager {
    
    func renameTask() {
        
        print("\n")
        
        print("Which task would you like to rename?")
        
        let sortedArray = sortArray(tasks: TaskManager.sharedInstance.taskArray)
        
        for (i, index) in sortedArray.enumerated() {
            
            print("\(i + 1) \(index.title) Priority Level: \(index.priority)")
            
        }
        
        let newTaskName = getString()
        
        
        
    }
    
}
