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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func addtaskbutton(_ sender: Any) {
        
      
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tasknew = Task(context: context)
        tasknew.name = newtaskname.text!
        tasknew.imp = importance.isOn
        
        //Save To database
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //After clicking add go back to the list
        navigationController!.popViewController(animated: true)
        
    }

}
