//
//  Utility Functions.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation


func getString() -> String {
    
    var input: String? = nil
    
    repeat {
        
        let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != "" {
            
            input = line
            
        } else {
            
            print("Invalid input! Please try again:")
        }
        
    } while input == nil
    
    return input!
    
}

func getPriority() -> String {
    
    var input: String? = nil
    
    repeat {
        
        let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line == "Low" || line == "Average" || line == "High"  {
            
            input = line
            
        } else {
            
            print("Invalid input")
        }
        
    } while input == nil
    
    return input!
}

func validateInput( _ input: String) -> Bool {
    
    let menuOptions = Array(1...10)
    
    guard let number = Int(input) else { return false }
    
    return menuOptions.contains(number)
}

func validateInput2( _ input: String) -> Bool {
    
    let menuOptions = Array(1...5)
    
    guard let number = Int(input) else { return false }
    
    return menuOptions.contains(number)
}

func getArrayInput() -> Int {
    
    print("\n")
    
    print("Please enter in valid number:")
    
    var input: Int? = nil
    
    repeat {
        
        if let line = Int(readLine()!) {
            
            if line > 0 && line < TaskManager.sharedInstance.taskArray.count + 1 {
                
                input = line
                
            } else {
                
                print("Invalid Input! Please enter in a number between 1 and \(TaskManager.sharedInstance.taskArray.count)")
                
            }
            
        }  else {
            
            print("Invalid Input! Please enter in a number between 1 and \(TaskManager.sharedInstance.taskArray.count)")
            
        }
        
    } while input == nil
    
    return input!
    
}

func checkPassword(pass: String) -> Bool {
    
    var permission = false
    
    var passwordAttempts = 3
    
    repeat {
        
        let passwordAttempt = getString()
        
        if passwordAttempt == "Avengers Assemble" {
            
            easterEgg1()
            break
            
        } else if passwordAttempt == pass {
            
            permission = true
            
            break
            
        } else {
            
            print("Sorry we don't recognize that password!")
            
            passwordAttempts -= 1
            
            print("\n")
            
            if passwordAttempts == 1 {
                
                print("You have 1 password attempt left.")
                
            } else {
            
            print("You have \(passwordAttempts) password attempts left.")
            }
            
            
        }
        
    } while passwordAttempts > 0
    
    return permission
    
}


func sortArray(tasks: [Task]) -> [Task] {
    
    return tasks.sorted(by: { (task1, task2) -> Bool in
        
        return task1.priority.rawValue < task2.priority.rawValue
    })
}

func getNumber() -> Int {
    
    var num: Int? = nil
    
    repeat {
        
        let line = Int(readLine()!)
        
        guard let _ = line else {
            
            print("Invalid input! Please try again:")
            
            continue
            
        }
        if line! >= 0 {
            
            num = line
            
        } else {
            
            print("Invalid input! Please try again:")
            num = nil
        }
        
    } while num == nil
    
    return num!
    
}


