//
//  InboxViewController.swift
//  Inbox
//
//  Created by Alan Westbrook on 3/17/15.
//  Copyright (c) 2015 Marcelo Marfil. All rights reserved.
//

import Cocoa
import WebKit

class InboxViewController: NSViewController {
    @IBOutlet var webView:WebView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        webView?.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.9 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.9"
        webView?.mainFrameURL = "http://inbox.google.com/"
        
    }
    
}
