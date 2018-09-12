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
