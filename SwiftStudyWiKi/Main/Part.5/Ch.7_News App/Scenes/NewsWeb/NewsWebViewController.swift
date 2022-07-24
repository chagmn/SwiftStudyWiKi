//
//  NewsWebViewController.swift
//  SwiftStudyWiKi
//
//  Created by ChangMin on 2022/07/24.
//

import WebKit
import SnapKit
import UIKit

final class NewsWebViewController: UIViewController {
    private let webView = WKWebView()
    
    private lazy var rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "link"),
        style: .plain,
        target: self,
        action: #selector(didTapRightBarButtonItem)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupWebView()
    }
}

private extension NewsWebViewController {
    func setupNavigationBar() {
        navigationItem.title = "기사 제목"
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationController?.navigationBar.tintColor = .systemOrange
    }
    
    func setupWebView() {
        guard let linkURL = URL(string: "https://fastcampus.co.kr/") else {
            navigationController?.popViewController(animated: true)
            return
        }
        
        view = webView
        
        let urlRequest = URLRequest(url: linkURL)
        webView.load(urlRequest)
    }
    
    @objc func didTapRightBarButtonItem() {
        UIPasteboard.general.string = "뉴스 링크"
    }
}
