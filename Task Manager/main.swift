//
//  main.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

let taskMenu = TaskMenu()

print("To use the Task Manager, please enter in an administrator password:")

let password = checkPassword(pass: "Will Ferrell")

if password == true {
    
    print("\n")
    
    print("Welcome to the Task Manager!")
    
    print("\n")
    
    taskMenu.go()
    
} else {
    
    print("User access not permitted")
    exit(0)
    
}
