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
        
        TaskManager.sharedInstance.sortArray()
        
        for (i, index) in TaskManager.sharedInstance.taskArray.enumerated() {
            
            print("\(i + 1) \(index.title) | Priority Level: \(index.priority)")
            
        }
        
        let chosenTask = getArrayInput()
        
        print("\n")
        
        print("What would you like to rename that task?")
        
        let newTaskTitle = getString()
        
        TaskManager.sharedInstance.taskArray[chosenTask - 1].title = newTaskTitle
        
        print("\n")
        
        print("Your task is now named \(newTaskTitle)")
        
    }
    //END OF RENAME TASK
    
    func editDescription() {
        
        print("\n")
        
        print("Which task's description would you like to rename?")
        
        TaskManager.sharedInstance.sortArray()
        
        for (i, index) in TaskManager.sharedInstance.taskArray.enumerated() {
            
            print("\(i + 1) \(index.title) | Priority Level: \(index.priority)")
            
        }
        
        let chosenTask = getArrayInput()
        
        print("\n")
        
        print("What would you like to set the description to?")
        
        let newTaskDescription = getString()
        
        TaskManager.sharedInstance.taskArray[chosenTask - 1].description = newTaskDescription
        
        print("\n")
        
        print("Your task's description is now set to \(newTaskDescription)")
        
    }
    //END OF EDIT DESCRIPTION
    
    func changePriority() {
        
        print("\n")
        
        print("Which task's priority would you like to change?")
        
        TaskManager.sharedInstance.sortArray()
        
        for (i, index) in TaskManager.sharedInstance.taskArray.enumerated() {
            
            print("\(i + 1) \(index.title) | Priority Level: \(index.priority)")
            
        }
        
        let chosenTask = getArrayInput()
        
        print("\n")
        
        print("What would you like to set the priority to?")
        
        var taskPriority: Task.PriorityChoice!
        
        let priorityInput = getPriority()
        
        if priorityInput == "High" {
            
            taskPriority = .High
            
        } else if priorityInput == "Average" {
            
            taskPriority = .Average
            
        } else if priorityInput == "Low" {
            
            taskPriority = .Low
        }
        
        TaskManager.sharedInstance.taskArray[chosenTask - 1].priority = taskPriority
        
        print("\n")
        
        print("Your task's priority is now set to \(priorityInput)")
        
    }
    //END OF CHANGE PRIORITY
    
    func assignDueDate() {
        
        print("\n")
        
        print("Which task would you like to give a new due date to?")
        
        TaskManager.sharedInstance.sortArray()
        
        for (i, index) in TaskManager.sharedInstance.taskArray.enumerated() {
            
            print("\(i + 1) \(index.title) | Priority Level: \(index.priority)")
            
        }
        
        let chosenTask = getArrayInput()
        
        print("\n")
        
        print("How many days does this task have to complete?")
        
        let currentCalender = Calendar.current
        
        let number = getNumber()
        
        let completeBy = currentCalender.date(byAdding: .day, value: number, to: Date())
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM d, yyyy"
        
        TaskManager.sharedInstance.taskArray[chosenTask - 1].dueDate = dateFormatter.string(from: completeBy!)
        
        print("Your task now need to be completed by \(dateFormatter.string(from: completeBy!))")
        
    }
    //END OF ASSIGN DUE DATE
    
}


