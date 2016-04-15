//
//  TaskController.swift
//  PracticeTask4
//
//  Created by Retika Kumar on 4/15/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var mockTask: [Task] {
        let task1 = Task(name: "go home", due: nil, notes: nil)
        let task2 = Task(name: "take exam", due: nil, notes: nil)
        return [task1, task2]
    }

    var task: [Task]{
        let request = NSFetchRequest(entityName: "Task")
        do{
            
       return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Task]
        }catch{
            return []
        }
        }
        
    
var completeTasks :[Task] {
    return task.filter({ $0.isComplete.boolValue })

}
var incompleteTask :[Task]{
    return task.filter({ !$0.isComplete.boolValue})

}

    func addTask(task:Task)  {
        saveToPersistenStore()
}
    func removeTask(task:Task)  {
        return Stack.sharedStack.managedObjectContext.deleteObject(task)
}
    func saveToPersistenStore() {
        do {
            try Stack.sharedStack.managedObjectContext.save()
        }catch {
            print("error occured")
            
        }
}
}