//
//  ViewController.swift
//  web222
//
//  Created by Diego Gomes on 01/11/2015.
//  Copyright (c) 2015 Nylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://nylondev.wordpress.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data, reposnse, error) in
            
            if error == nil {
                let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(urlContent)
                
                //essa linha aqui faz com que o processo de carregar a pagina se torno 20% mais rapido
                dispatch_async(dispatch_get_main_queue()) {
                    self.webview.loadHTMLString(urlContent! as String, baseURL: nil)
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

