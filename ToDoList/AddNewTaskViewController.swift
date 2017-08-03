//
//  AddNewTaskViewController.swift
//  ToDoList
//
//  Created by Trilok Behere on 8/3/17.
//  Copyright © 2017 Tridev. All rights reserved.
//

import UIKit

class AddNewTaskViewController: UIViewController {

    @IBOutlet weak var newtaskname: UITextField!
    
    @IBOutlet weak var importance: UISwitch!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addtaskbutton(_ sender: Any) {
        
        let tasknew = Task()
        
        tasknew.name = newtaskname.text!
        tasknew.imp = importance.isOn
        
        previousVC.tasks.append(tasknew)
        
        //Reload data in first view controller to display
        
        previousVC.tableviewTasks.reloadData()
        //After clicking add go back to the list
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
