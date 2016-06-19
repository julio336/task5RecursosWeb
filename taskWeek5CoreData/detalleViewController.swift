//
//  detalleViewController.swift
//  taskWeek5CoreData
//
//  Created by Julio Ahuactzin on 18/06/16.
//  Copyright © 2016 Julio Ahuactzin. All rights reserved.
//

import UIKit

class detalleViewController: UIViewController {
    
    var titulo = ""
    var autores = ""
    var imagenPortada:NSData? = nil
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titulo
        authorLabel.text = autores
        //let urlImage = NSURL(string: imagenPortada)
        //let data = NSData(contentsOfURL: urlImage!)
        //imageOutlet.image = UIImage(data: data!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
