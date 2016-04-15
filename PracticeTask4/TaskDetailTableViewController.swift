//
//  TaskDetailTableViewController.swift
//  PracticeTask4
//
//  Created by Retika Kumar on 4/15/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
    var dueDateValue: NSDate?
    
    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    @IBAction func dueDatePickerTapped(sender: UIDatePicker) {
        //self.dueDatePicker = sender.date.
        
    }
    @IBAction func saveButtonTapped(sender: AnyObject) {
        updateTask()
        navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func updateTask() {
        
        let name = taskNameTextField.text!
        let due = dueDateValue
        let notes = taskNotesTextView.text
        if let task = self.task {
            task.name = name
            task.due = due
            task.notes = notes
            
            
        } else {
            let newTask = Task(name: name, due: due, notes: notes)
            return TaskController.sharedController.addTask(newTask)
        }
        
        
    }
    func updateWithTask(task:Task) {
        self.task = task
        title = task.name
        taskNameTextField.text = task.name
        if let notes = task.notes {
            taskNotesTextView.text = task.notes
        }
        
        
        
    }
    
}