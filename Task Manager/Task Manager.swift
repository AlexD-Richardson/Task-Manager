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
        
        [Task(title: "Kill Thanos",
              description: "Aim for the head",
              priority: .High),
         
         Task(title: "Collect ashes of fallen Avengers",
              description: "Check weather for high winds",
              priority: .Average),
         
         Task(title: "Use Nebula to build ship out of her spare parts",
              description: "Make sure to tell her she isn't a waste of parts",
              priority: .High)]
    
    
    func addTask() {
        
        print("\n")
        
        
        print("If you want to add a task to the Task Manager, you must enter an administrator password.")
        
        let password = checkPassword(pass: "Thanos did nothing wrong")
        
        if password == false {
            
            print("Returning to Menu...")
            
            sleep(2)
            
            return
            
        } 
        
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
        
        print("\n")
        
        print("Would you like to give this task a due date? Please answer with a Yes or No.")
        
        var yesOrNo = getString()
        
        repeat {
        
        if yesOrNo == "Yes" {
            
            print("How many days does this task have to complete?")
            
            let currentCalender = Calendar.current
            
            let number = getNumber()
            
            let completeBy = currentCalender.date(byAdding: .day, value: number, to: Date())
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MMMM d, yyyy"
            
            taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
            
            taskArray[taskArray.count - 1].dueDate = dateFormatter.string(from: completeBy!)
            
            print("Your task now need to be completed by \(dateFormatter.string(from: completeBy!))")
            
            print("\n")
            
            print("Your task has now been added!")
            
            break
            
        } else if yesOrNo == "No" {
            
            print("\n")
            
            taskArray.append(Task(title: taskName, description: taskDescription, priority: taskPriority))
            
            print("Your task has now been added!")
            
            break
            
        } else {
            
            print("Please answer with a Yes or No")
            yesOrNo = getString()
            
        }
            
        } while yesOrNo != "Yes" || yesOrNo != "No"
        
        print("\n")
    }
    //END OF ADD TASK
    
    func removeTask() {
        
        print("\n")
        
        print("If you want to remove a game from the Video Game Library, you must enter an administrator password.")
        
        let password = checkPassword(pass: "Thanos did nothing wrong")
        
        if password == false {
            
            print("Returning to Menu...")
            
            sleep(2)
            
            return
            
        } else {
            
            
            print("Welcome Admin! Please enter in a number corresponding to the task you want to remove:")
            
            print("\n")
            
            let sortedArray = sortArray(tasks: taskArray)
            
            for (i, index) in sortedArray.enumerated() {
                
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
        
        let sortedArray = sortArray(tasks: taskArray)
        
        for task in sortedArray {
            
            if task.dueDate == nil {
            
            print("\(task.title) | Description: \(task.description) | Priority: \(task.priority)")
                
                
            } else if task.dueDate != nil {
                
                print("\(task.title) | Description: \(task.description) | Priority: \(task.priority) | Due Date: \(task.dueDate!)")
                
            }
        }
        
        print("\n")
    }
    //END OF LIST ALL TASKS
    
    func ListUncompletedTasks() {
        
        print("\n")
        
        var funcCont = 0
        
        for task in taskArray {
            
            if !task.completionStatus {
                
                funcCont += 1
                
            }
        }
        
        if funcCont == 0 {
            
            return print("There are no tasks uncompleted tasks at the moment. Sorry!")
        }
        
        
        print("Here are the tasks we have available:")
        
        print("\n")
        
        let sortedArray = sortArray(tasks: taskArray)
        
        for task in sortedArray {
            
            if task.completionStatus == false {
                
                if task.dueDate == nil {
                    
                    print("\(task.title) | Description: \(task.description) | Priority: \(task.priority)")
                    
                    
                } else if task.dueDate != nil {
                    
                    print("\(task.title) | Description: \(task.description) | Priority: \(task.priority) | Due Date: \(task.dueDate!)")
                    
                }
            }
        }
        
        print("\n")
    }
    //END OF UNCOMPLETED TASKS
    
    func ListCompletedTasks() {
        
        print("\n")
        
        var funcCont = 0
        
        let sortedArray = sortArray(tasks: taskArray)
        
        for task in sortedArray {
            
            if task.completionStatus {
                
                funcCont += 1
                
            }
        }
        
        if funcCont == 0 {
            
            return print("There are no tasks completed at the moment. Sorry!")
        }
        
        
        print("Here are the tasks that are completed:")
        
        print("\n")
        
        for task in sortedArray {
            
            if task.completionStatus == true {
                
                if task.dueDate == nil {
                    
                    print("\(task.title) | Description: \(task.description) | Priority: \(task.priority)")
                    
                    
                } else if task.dueDate != nil {
                    
                    print("\(task.title) | Description: \(task.description) | Priority: \(task.priority) | Due Date: \(task.dueDate!)")
                    
                }
            }
        }
        
        print("\n")
        
    }
    //END OF LIST COMPLETED TASKS
    
    func MarkTaskAsComplete() {
        
        var funcCont = 0
        
        let sortedArray = sortArray(tasks: taskArray)
        
        for task in sortedArray {
            
            if !task.completionStatus {
                
                funcCont += 1
                
            }
        }
        
        if funcCont == 0 {
            
            return print("There are no tasks uncompleted tasks at the moment. Sorry!")
        }
        
        print("Please enter in a number corresponding to the task you want to mark as complete:")
        
        print("\n")
        
        
        for (i, index) in sortedArray.enumerated() {
            
            if index.completionStatus == false {
                
                if index.dueDate == nil {
                    
                    print("\(i + 1) \(index.title) | Description: \(index.description) | Priority: \(index.priority)")
                    
                    
                } else if index.dueDate != nil {
                    
                    print("\(i + 1) \(index.title) | Description: \(index.description) | Priority: \(index.priority) | Due Date: \(index.dueDate!)")
                    
                }
            }
        }
        
        print("\n")
        
        var indexInput = getArrayInput()
        
        if taskArray[indexInput - 1].completionStatus == true {
            
            repeat {
                
                indexInput = getArrayInput() - 1
                
            } while taskArray[indexInput - 1].completionStatus == true
            
        }
        
        taskArray[indexInput - 1].completionStatus = true
        
        print("\n")
        
        print("That task is now completed! Nice job.")
        
        
    }
    //END OF MARK TASK AS COMPLETE
    
    func MarkTaskAsIncomplete() {
        
        var funcCont = 0
        
        let sortedArray = sortArray(tasks: taskArray)
        
        for task in sortedArray {
            
            if task.completionStatus {
                
                funcCont += 1
                
            }
        }
        
        if funcCont == 0 {
            
            return print("There are no tasks completed tasks at the moment. Sorry!")
        }
        
        print("Please enter in a number corresponding to the task you want to mark as incomplete:")
        
        print("\n")
        
        
        for (i, index) in sortedArray.enumerated() {
            
            if index.completionStatus == true {
                
                if index.dueDate == nil {
                    
                    print("\(i + 1) \(index.title) | Description: \(index.description) | Priority: \(index.priority)")
                    
                    
                } else if index.dueDate != nil {
                    
                    print("\(i + 1) \(index.title) | Description: \(index.description) | Priority: \(index.priority) | Due Date: \(index.dueDate!)")
                    
                }
                
            }
        }
        
        print("\n")
        
        var indexInput = getArrayInput()
        
        if taskArray[indexInput - 1].completionStatus == false {
            
            repeat {
                
                indexInput = getArrayInput()
                
            } while taskArray[indexInput - 1].completionStatus == false
            
        }
        
        
        taskArray[indexInput - 1].completionStatus = false
        
        print("\n")
        
        print("That task is now marked as incomplete!")
        
    }
    
}
//End of Mark Task as Incomplete







