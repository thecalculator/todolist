//
//  ViewController.swift
//  ToDoList
//
//  Created by Trilok Behere on 8/3/17.
//  Copyright © 2017 Tridev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableviewTasks: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTaks()
        
        tableviewTasks.delegate = self
        tableviewTasks.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        if task.imp {
        cell.textLabel?.text = "❗️ \(task.name)"
        } else {
        cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableviewTasks.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "taskdetails", sender: tasks[indexPath.row])
    }
    
   
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let nextVC = segue.destination as! AddNewTaskViewController
        nextVC.previousVC = self
     
     
     }
    
    
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let deatailobj = segue.destination as! TaskDetailViewController
        deatailobj.tasksdetails = sender as! Task
        
        
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeTaks() -> [Task] {
        
        let task1 = Task()
        task1.name = "Walk dog"
        task1.imp = false;
        
        let task2 = Task()
        task2.name = "Fuck"
        task2.imp = true;
        
        let task3 = Task()
        task3.name = "Buy Cheese"
        task3.imp = false;
        
        return [task1, task2, task3]
    
        
    }
    
    
    @IBAction func addNewTask(_ sender: Any) {
        performSegue(withIdentifier: "addnewtask", sender: nil)
    }
}

