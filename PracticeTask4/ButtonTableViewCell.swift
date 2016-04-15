//
//  ButtonTableViewCell.swift
//  PracticeTask4
//
//  Created by Retika Kumar on 4/15/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var primaryLabel: UILabel!
    
    
    @IBOutlet weak var completeButton: UIButton!

   var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            
            
            
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(isComplete: Bool) {
        
        if isComplete {
            
            
            
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
            
            
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

    protocol ButtonTableViewCellDelegate {
        
        func buttonCellButtonTapped(sender: ButtonTableViewCell)
    }
    
    extension ButtonTableViewCell {
        
        func updateWithTask(task: Task) {
            
            primaryLabel.text = task.name
            
            // completeButton.imageView?.image."complete"
            
            
            updateButton(task.isComplete.boolValue)
        }

}



