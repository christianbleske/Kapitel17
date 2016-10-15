//
//  ViewController.swift
//  DispatchQueueBsp
//
//  Created by Christian Bleske on 12.01.16.
//  Copyright © 2016 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let urls = ["https://christianbleske.files.wordpress.com/2015/12/unterwasser.jpg","https://christianbleske.files.wordpress.com/2015/12/wasser.jpg","https://christianbleske.files.wordpress.com/2015/12/landschaft.jpg"]

    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonDialog(_ sender: AnyObject) {
        showAlertViewWithTitle("Info", message: "Dies ist ein Dialog")
    }
    
    @IBAction func loadButton(_ sender: AnyObject) {
    
    //Beispiel Concurrent Queue
    //    let concurrentQueue = DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault)

        let concurrentQueue = DispatchQueue(label: "myConcurrentQueue", attributes: [.concurrent])
        concurrentQueue.async { () -> Void in
            
            let loader1 = ImageLoader.loadImageFromURL(self.urls[0])
            DispatchQueue.main.async(execute: {
                
                self.imageView1.image = loader1
            })
            
        }
        
        concurrentQueue.async { () -> Void in
            
            let loader2 = ImageLoader.loadImageFromURL(self.urls[1])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView2.image = loader2
            })
            
        }
        
        concurrentQueue.async { () -> Void in
            
            let loader3 = ImageLoader.loadImageFromURL(self.urls[2])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView3.image = loader3
            })
            
        }
    
    //Beispiel Serial Queue
        
    /*  let serialQueue = DispatchQueue(label: "mySerialQueue", attributes: [.serial])
        
        serialQueue.async { () -> Void in
            
            let loader1 = ImageLoader.loadImageFromURL(self.urls[0])
            DispatchQueue.main.async(execute: {
                
                self.imageView1.image = loader1
            })
            
        }
        
        serialQueue.async { () -> Void in
            
            let loader2 = ImageLoader.loadImageFromURL(self.urls[1])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView2.image = loader2
            })
            
        }
        
        serialQueue.async { () -> Void in
            
            let loader3 = ImageLoader.loadImageFromURL(self.urls[2])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView3.image = loader3
            })
            
        } */
        
    }
    
    func showAlertViewWithTitle(_ title:String, message:String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // ...
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
        
    }
    
}

