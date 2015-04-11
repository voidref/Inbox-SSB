//
//  InboxViewController.swift
//  Inbox
//
//  Created by Alan Westbrook on 3/17/15.
//  Copyright (c) 2015 Marcelo Marfil & Alan Westbrook. All rights reserved.
//

import Cocoa
import WebKit

class InboxViewController: NSViewController, WKNavigationDelegate, WKUIDelegate {
    private var webView:InboxWebView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.9 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.9"
        
        let wv = InboxWebView(frame: view.bounds)
        wv.UIDelegate = self
        wv.translatesAutoresizingMaskIntoConstraints = false
        wv.setAgent(userAgent)        
        
        view.addSubview(wv)

        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[wv]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["wv": wv]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[wv]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["wv": wv]))
        self.webView = wv

        let request = NSMutableURLRequest(URL: NSURL(string: "http://inbox.google.com/")!)
        wv.loadRequest(request) 
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.movableByWindowBackground = true
        self.view.window!.styleMask = self.view.window!.styleMask | NSFullSizeContentViewWindowMask;
    }
    
    // Open links in browser nuttyness
    func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        let haxview = WKWebView(frame: self.view.bounds, configuration: configuration)
        haxview.navigationDelegate = self
        haxview.hidden = true
        self.view.addSubview(haxview)
        return haxview
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.Cancel)
        webView.removeFromSuperview()
        NSWorkspace.sharedWorkspace().openURL(navigationAction.request.URL!)
    }
}

