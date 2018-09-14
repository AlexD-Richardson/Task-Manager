//
//  Task Manager.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class TaskManager {
    
    
    static let sharedInstance = TaskManager()
    private init() {
        
    }
    
    
    var taskArray: [Task] =
        
        [Task(title: "Organize room", description: "Get ya room cleaned ya doof", priority: .Low),
         Task(title: "Buy batteries", description: "Your remote is dead yo!", priority: .Average),
         Task(title: "Beat Video Games", description: "You buy all these games but never beat them!", priority: .High)]
    
    func addTask() {
        print("\n")
        
        print("If you want to add a task to the Task Manager, you must enter an administrator password.")
        
        let password = checkPassword()
        
        if password == false {
            
            print("Returning to Menu...")
            
            sleep(2)
            
            return
            
        } else {
            
            print("\n")
            
            print("Welcome Admin! Please enter the title of the task you want to add:")
            
            let taskName = getString()
            
            print("\n")
            
            print("Please enter a description for your task")
            
            let taskDescription = getString()
            
            print("\n")
            
            print("Please give this task a priority level of High, Average, or Low")
            
            var taskPriority: Task.PriorityChoice!
            
            let priorityInput = getPriority()
            
            if priorityInput == "High" {
                
                taskPriority = .High
                
            } else if priorityInput == "Average" {
                
                taskPriority = .Average
                
            } else if priorityInput == "Low" {
                taskPriority = .Low
            }
            
            taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
        }
        
        print("\n")
    }
    //END OF ADD TASK
    
    func removeTask() {
        
        print("\n")
        
        print("If you want to remove a game from the Video Game Library, you must enter an administrator password.")
        
        let password = checkPassword()
        
        if password == false {
            
            print("Returning to Menu...")
            
            sleep(2)
            
            return
            
        } else {
            
            
            print("Welcome Admin! Please enter in a number corresponding to the task you want to remove:")
            
            print("\n")
            
            for (i, index) in taskArray.enumerated() {
                
                print("\(i + 1) \(index.title) Priority Level: \(index.priority)")
                
            }
            
            print("\n")
            
            let indexInput = getArrayInput()
            
            if taskArray[indexInput - 1].priority == .High {
                
                print("This task's priority is set to high. Are you sure you want to remove that task?")
                
                print("Please answer with a Yes or No")
                
                var YesOrNo = getString()
                
                repeat {
                    
                    if YesOrNo == "Yes" {
                        
                        taskArray.remove(at: indexInput - 1)
                        
                        print("The task is removed now.")
                        
                        break
                        
                    } else if YesOrNo == "No" {
                        
                        print("Glad we double checked!")
                        
                        break
                        
                    } else {
                        
                        print("Invalid Input! Please answer with a Yes or No")
                        
                        YesOrNo = getString()
                        
                    }
                    
                    
                } while YesOrNo != "Yes" || YesOrNo != "No"
                
                
                
            } else {
                
                taskArray.remove(at: indexInput - 1)
                
                print("The task is removed now!")
                
            }
            
            print("\n")
        }
        
    }
    //END OF REMOVE TASK
    
    func listAllTasks() {
        
        print("\n")
        
        print("Here are all the tasks:")
        
        print("\n")
        
        for task in taskArray {
            
            print("\(task.title) | Description: \(task.description) | Priority: \(task.priority)")
        }
        
        print("\n")
    }
    //END OF LIST ALL TASKS
    
    func ListUncompletedTasks() {
        
        print("\n")
        
        var funcCont = true
        
        for task in taskArray {
            
            if task.completionStatus {
                
                funcCont = false
            }
        }
        
        if !funcCont {
            
            return print("There are no tasks unavailable at the moment. Sorry!")
        }
        
        
        print("Here are the tasks we have available:")
        
        print("\n")
        
        for task in taskArray {
            
            if task.completionStatus == false {
                print("\(task.title) | Priority: \(task.priority)")
            }
        }
        
        print("\n")
    }
    //END OF UNCOMPLETED TASKS
    
    func ListCompletedTasks() {
        
        
        
    }
    
    
    
    
}




