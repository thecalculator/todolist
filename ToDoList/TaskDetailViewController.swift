//
//  TaskDetailViewController.swift
//  ToDoList
//
//  Created by Trilok Behere on 8/3/17.
//  Copyright © 2017 Tridev. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    
    @IBOutlet weak var taskname: UILabel!
    
    var tasksdetails = Task()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tasksdetails.imp{
            taskname.text = "❗️\(tasksdetails.name!)"
        }else{
            taskname.text = tasksdetails.name
        }
        
    }

    @IBAction func deletetask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tasksdetails)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }

   

}
