//
//  Tasks.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Task {
    
    let title: String
    
    let description: String
    
    var completionStatus: Bool
    
    var completeByDate: Date
    
    var priority: PriorityChoice
    
    enum PriorityChoice {
        
        case High
        case Average
        case Low
        
        
    }
    
    init(title: String, description: String, completeByDate: Date, priority: PriorityChoice) {
        
    self.title = title
    self.description = description
    self.completeByDate = completeByDate
    self.priority = priority
    self.completionStatus = false
    
    }
    
    
    
}
