//
//  ViewController.swift
//  web222
//
//  Created by Diego Gomes on 01/11/2015.
//  Copyright (c) 2015 Nylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var webview: UIWebView!
    @IBOutlet var indicator: UIActivityIndicatorView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //webview nao tem anda delegado e para funcionar o recurso de load deve-se associar
        webview.delegate = self
        
        let url = NSURL(string: "http://nylondev.wordpress.com")
       
        //quando usei essa simples requisicao a pagina carregou muito mais rapida
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
        indicator.hidden = true
        
        
        
        //essa requisicao busca primeiro o html da pagina e depois carrega
        //nao sei ao certo ainda quando necessario usar essa conosulta,porque
        // a consulta simples de cima é mais rapida
       /* let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
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
        
        task.resume()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        indicator.startAnimating()
    }


    func webViewDidFinishLoad(webView: UIWebView) {
        indicator.stopAnimating()
    }
    
    
    @IBAction func reloader(sender: AnyObject) {
        indicator.startAnimating()
    }
}

