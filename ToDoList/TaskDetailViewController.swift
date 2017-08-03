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

        // Do any additional setup after loading the view.
        
        
        taskname.text = tasksdetails.name
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
