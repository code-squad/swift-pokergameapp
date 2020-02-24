//
//  ViewController.swift
//  CardGameApp
//
//  Created by 한천희 on 2020/02/11.
//  Copyright © 2020 한천희. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cardBackStackView: UIStackView = UIStackView()
    let cardBackImageView1: UIImageView = UIImageView()
    let cardBackImageView2: UIImageView = UIImageView()
    let cardBackImageView3: UIImageView = UIImageView()
    let cardBackImageView4: UIImageView = UIImageView()
    let cardBackImageView5: UIImageView = UIImageView()
    let cardBackImageView6: UIImageView = UIImageView()
    let cardBackImageView7: UIImageView = UIImageView()
    
    let cardRatio: CGFloat = CGFloat(1.27)
    let cardBackImageName: String = "card-back"
    
    

    // 이 뷰가 메모리에 생성 됐음.(사용자가 보는 시점과는 상관 X)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // 뷰가 보여진 후에 실행됨
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "bg_pattern")!))
        
        darwCardBack()
        
    }
    
    
    
    // StatusBar 스타일
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
    }
    
    
    
    func setupCardBackStackView() {
        view.addSubview(cardBackStackView)
        cardBackStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cardBackStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true // 왼쪽 여백
        cardBackStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true // 오른쪽 여백
        cardBackStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true // 윗쪽 여백
//        cardBackStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -750).isActive = true // 바닥 여백
         
        cardBackStackView.axis = .horizontal      // 뷰들이 수평으로 나열됨
        cardBackStackView.alignment = .top     // 뷰들이 horizontal(수직) 일 때 뷰들이 어떻게 나열될 지 정함.
        cardBackStackView.distribution = .equalSpacing  // 뷰들이 vertical(수평) 일 때 뷰들이 어떻게 나열될 지 정함
        cardBackStackView.spacing = 5          // 각 인접한 뷰들의 마진(간격)
    }
    
    
    
    func setupCardBackImageView(imageView: UIImageView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage.init(named: cardBackImageName)
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: cardRatio).isActive = true
        cardBackStackView.addArrangedSubview(imageView)
        
    }
    
    
    
    func darwCardBack() {
        setupCardBackStackView()
        
        setupCardBackImageView(imageView: cardBackImageView1)
        setupCardBackImageView(imageView: cardBackImageView2)
        setupCardBackImageView(imageView: cardBackImageView3)
        setupCardBackImageView(imageView: cardBackImageView4)
        setupCardBackImageView(imageView: cardBackImageView5)
        setupCardBackImageView(imageView: cardBackImageView6)
        setupCardBackImageView(imageView: cardBackImageView7)
    }

}
