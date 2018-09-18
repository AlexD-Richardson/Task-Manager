//
//  EditTask Menu.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/17/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

let taskmenu = TaskMenu()

class subMenu {
    
    var shouldQuit2 = false
    
    func go2() {
        
        editTaskMenuPassCheck()
        
        print("\n")
        
        help2()
        
        repeat {
            
            var input2 = getString()
            
            while validateInput2(input2) == false {
                
                print("Invalid Input")
                
                input2 = getString()
            }
            
            handleInput2(input2)
            
            
        } while !shouldQuit2
        
    }
    
    func editTaskMenuPassCheck() {
        
        print("\n")
        
        print("Please enter in the password to enter the edit menu")
        
        let password = checkPassword(pass: "There was no other way")
        
        if password == false {
            
            quit2()
            
            sleep(2)
            
        }
    }
    
    func help2() {
        
        print("""
        Menu > Edit a task
        1 Rename task
        2 Edit description
        3 Change Priority
        4 Assign due date/ Re-assign due date
        5 Main Menu
        
        """)
        
        print("Please enter a number corresponding to the option you want:")
        
    }
    
    func handleInput2(_ input: String) {
        switch input {
        case "1":
            
            print("\n")
            help2()
        case "2":
            
            print("\n")
            help2()
        case "3":
            
            print("\n")
            help2()
        case "4":
            
            print("\n")
            help2()
        case "5":
            quit2()
            print("\n")
        default:  //if input is anything else
            break
        }
    }
    
    func quit2() {
        shouldQuit2 = true
        print("Back to the main menu...")
        sleep(2)
        
    }
    
}

