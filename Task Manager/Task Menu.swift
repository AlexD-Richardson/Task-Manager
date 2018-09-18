//
//  Task Menu.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

let editATask = subMenu()

class TaskMenu {
    
    var shouldQuit = false
    
    
    func go() {
        
        help()
        
        repeat {
            
            var input = getString()
            
            while validateInput(input) == false {
                
                print("Invalid Input")
                
                input = getString()
            }
            
            handleInput(input)
            
            
        } while !shouldQuit
        
    }
    
    
    func help() {
        
        print("""
        Menu
        1 Create New Task
        2 Remove Current Task
        3 List All Tasks
        4 List Uncompleted Tasks
        5 List Completed Tasks
        6 Mark Incomplete Task As Complete
        7 Mark Completed Task As Incomplete
        8 Edit a task
        9 Help
        10 Quit
        
        """)
        
        print("Please enter a number corresponding to the option you want:")
        
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            TaskManager.sharedInstance.addTask()
            print("\n")
            help()
        case "2":
            TaskManager.sharedInstance.removeTask()
            print("\n")
            help()
        case "3":
             TaskManager.sharedInstance.listAllTasks()
            print("\n")
            help()
        case "4":
             TaskManager.sharedInstance.ListUncompletedTasks()
            print("\n")
            help()
        case "5":
             TaskManager.sharedInstance.ListCompletedTasks()
            print("\n")
            help()
        case "6":
             TaskManager.sharedInstance.MarkTaskAsComplete()
            print("\n")
            help()
        case "7":
            TaskManager.sharedInstance.MarkTaskAsIncomplete()
            print("\n")
            help()
        case "8":
            editATask.go2()
            print("\n")
            help()
        case "9":
            help()
        case "10":
            quit()
        default:  //if input is anything else
            break
        }
    }
    
    func quit() {
        
        shouldQuit = true
        print("Exiting Task Manager...")
        sleep(2)
        
    }
    
   
}
