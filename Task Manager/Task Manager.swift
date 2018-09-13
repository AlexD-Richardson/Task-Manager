//
//  Task Manager.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class TaskManager {

private var gameArray: [Task] =
    
    [Task(title: "Organize room", description: "Get ya room cleaned ya doof", completeByDate: Date(), priority: .Low),
     Task(title: "Buy batteries", description: "Your remote is dead yo!", completeByDate: Date(), priority: .Average),
     Task(title: "Beat Video Games", description: "You buy all these games but never beat them!", completeByDate: Date(), priority: .High)]
    
    func addTask() {
        print("\n")
        
        print("If you want to add a task to the Task Manager, you must enter an administrator password.")
        
        let passwordAttempt = getString()
        
        if passwordAttempt == "Thanos did nothing wrong" {
            
            print("\n")
            
            print("Welcome Admin! Please enter the title of the task you want to add:")
            
            let taskName = getString()
            
            print("\n")
            
            print("Please enter a description for your task")
            
            let taskDescription = getString()
            
            print("\n")
            
            
            
            
            
        } else {
            
            print("Sorry we don't recognize that password.")
        }
        
        print("\n")
    }

}




