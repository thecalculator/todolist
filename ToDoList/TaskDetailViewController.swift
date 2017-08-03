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
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if tasksdetails.imp{
            taskname.text = "❗️ \(tasksdetails.name)"
        }else{
            taskname.text = tasksdetails.name
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deletetask(_ sender: Any) {
        
        previousVC.tasks.remove(at: previousVC.rowIndex)
        
        previousVC.tableviewTasks.reloadData()
        navigationController?.popViewController(animated: true)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
