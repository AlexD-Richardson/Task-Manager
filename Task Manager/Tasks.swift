//
//  Tasks.swift
//  Task Manager
//
//  Created by Alex Richardson on 9/12/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Task {
    
    
    
    var title: String
    
    var description: String
    
    var completionStatus: Bool
    
    var dueDate: String?
    
    var priority: PriorityChoice
    
    enum PriorityChoice: Int {
        
        case High = 1
        case Average
        case Low
        
        
    }
    
    init(title: String, description: String, priority: PriorityChoice) {
        
    self.title = title
    self.description = description
    self.priority = priority
    self.completionStatus = false
    
    }
    
    
    
}
