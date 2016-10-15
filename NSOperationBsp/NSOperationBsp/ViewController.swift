//
//  ViewController.swift
//  NSOperationBsp
//
//  Created by Christian Bleske on 28.12.15.
//  Copyright © 2015 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nsOperationQueue = OperationQueue()
    
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

    @IBAction func cancelButton(_ sender: AnyObject) {
        nsOperationQueue.cancelAllOperations()
        print("Operation abgebrochen!")
    }

    @IBAction func dialogButton(_ sender: AnyObject) {
        showAlertViewWithTitle("Info", message: "Dies ist ein Dialog")
        print("Dialog wurde aufgerufen!")
    }
    
    @IBAction func loadButton(_ sender: AnyObject) {
        //nsOperationQueue = NSOperationQueue()
        
        let nsBlockOperation1 = BlockOperation(block: {
            let loader1 = ImageLoader.loadImageFromURL(self.urls[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = loader1
            })
        })
        
        nsBlockOperation1.completionBlock = {
            print("Laden von Bild 1 durchgeführt = \(nsBlockOperation1.isCancelled)")
        }
        nsOperationQueue.addOperation(nsBlockOperation1)
        
        let nsBlockOperation2 = BlockOperation(block: {
            let loader2 = ImageLoader.loadImageFromURL(self.urls[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = loader2
            })
        })
        
        nsBlockOperation2.completionBlock = {
            print("Laden von Bild 2 durchgeführt = \(nsBlockOperation2.isCancelled)")
        }
        nsOperationQueue.addOperation(nsBlockOperation2)
        
        let nsBlockOperation3 = BlockOperation(block: {
            let loader3 = ImageLoader.loadImageFromURL(self.urls[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = loader3
            })
        })
        
        nsBlockOperation3.completionBlock = {
            print("Laden von Bild 3 durchgeführt = \(nsBlockOperation3.isCancelled)")
        }
        nsOperationQueue.addOperation(nsBlockOperation3)
        
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

