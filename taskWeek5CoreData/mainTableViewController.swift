//
//  mainTableViewController.swift
//  taskWeek5CoreData
//
//  Created by Julio Ahuactzin on 17/05/16.
//  Copyright © 2016 Julio Ahuactzin. All rights reserved.
//

import UIKit
import CoreData

var results:[AnyObject] = []
var resultsLibro:[AnyObject] = []
var titulos:[AnyObject] = []
var autores:[String] = []
var imagen:[AnyObject] = []

class mainTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        navigationItem.title = "Libros de openlibrary.org"
        self.tableView.reloadData()

        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        
        do{
            let request = NSFetchRequest(entityName: "Seccion")
            
            request.returnsObjectsAsFaults = false
            
            results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                /*for result:AnyObject in results {
                    
                  //  print(result.valueForKey("nombre")!)
                    
                }*/
            }
        }
        catch{
            
        }
        
        
        do{
            let request = NSFetchRequest(entityName: "Libro")
            
            request.returnsObjectsAsFaults = false
            
            resultsLibro = try context.executeFetchRequest(request)
            
        }
        catch{
            
        }
        
        /* Empty data base
        do {
            let request = NSFetchRequest(entityName: "Seccion")
            print(request)
            
            let result = try context.executeFetchRequest(request)
                for message in result {
                    context.deleteObject(message as! NSManagedObject)
                    try context.save()
                    print(message)
                    self.tableView.reloadData()
                }
            
        } catch {
            print("miss")
        }
        
        do {
            let request = NSFetchRequest(entityName: "Libro")
            print(request)
            
            let result = try context.executeFetchRequest(request)
            for message in result {
                context.deleteObject(message as! NSManagedObject)
                try context.save()
                print(message)
                self.tableView.reloadData()
            }
            
        } catch {
            print("miss")
        }
        */
        

        
        
        

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
  
    override func viewWillAppear(animated: Bool) {
        
        if results.count > 0 {
            for result:AnyObject in results {
                titulos.append(result.valueForKey("nombre") as! String)
            }
        }
        
        if resultsLibro.count > 0 {
            print(resultsLibro.count)
            for result:AnyObject in resultsLibro{
                
                if result.valueForKey("portada") != nil{
                    imagen.append(result.valueForKey("portada")!)
                }
                
                if result.valueForKey("autores") != nil{
                    autores.append(result.valueForKey("autores") as! String)
                }
            }
            
        }
        self.tableView.reloadData()


    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if results.count > 0 {
            return results.count
        }else{
            return 0
        }
        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

         if results.count > 0 {
            for result:AnyObject in results {
                titulos.append(result.valueForKey("nombre") as! String)
                cell.textLabel?.text = titulos[indexPath.row] as? String
            }
        }
            return cell
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

       // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detalle"{
                let book = segue.destinationViewController as! detalleViewController
                let ip = self.tableView.indexPathForSelectedRow
            
            
                let bookTitle = titulos[ip!.row] as? String
                book.titulo = bookTitle!
            
                let bookAutores = autores[ip!.row] as String
                book.autores = bookAutores
/*
                let test = imagen[ip!.row]
                print(test)
                book.imagenPortada = test as? NSData*/
            
        }
        
    }
    

}
