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
        tableviewTasks.delegate = self
        tableviewTasks.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTask()
        tableviewTasks.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.imp {
            cell.textLabel?.text = "❗️\(task.name!)"
            
        } else{
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableviewTasks.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "taskdetails", sender: tasks[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "taskdetails" {
            let deatailobj = segue.destination as! TaskDetailViewController
            deatailobj.tasksdetails = sender as! Task
        }
        
    }
    
    func getTask(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest())
            print(tasks)
        } catch {
            print("Error fetching data")
        }
        
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        performSegue(withIdentifier: "addnewtask", sender: nil)
    }
}

