//
//  WikiViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 06/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: Properties
    let model: House
    
    // MARK: Initialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        syncModelWithView()
    }
    
    func syncModelWithView() {
        // Mostramos el loadingView
        loadingView.isHidden = false
        // Lo animamos
        loadingView.startAnimating()
        
        title = model.name
        let request = URLRequest(url: model.wikiURL)
        webView.load(request)
    }
}

// Delegados
// Should: para perdir permiso
// Will: Oye, que sepas que estoy a punto de hacer algo
// Did: Hey! Que sepas que ya he terminado.
extension WikiViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Detener la animación del activity indicator
        loadingView.stopAnimating()
        // Ocultarlo
        loadingView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated, .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}
