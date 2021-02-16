    //
    //  ViewController.swift
    //  PokerGameApp
    //
    //  Created by kiyoungj on 2021/02/15.
    //
    
    import UIKit
    
    class ViewController: UIViewController {
        
        var stackView = UIStackView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // 뷰 배경 설정
            self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
            createCardView()
            self.view.addSubview(stackView)
            setStackViewContraints()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        
        // MARK: 스택뷰 Contraints 설정
        private func setStackViewContraints(){
            stackView.axis = .horizontal
            stackView.spacing = 5
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
            
        }
        
        // MARK: 카드뷰 생성
        private func createCardView() {
            
            for _ in 1...7 {
                
                let cardImageView = UIImageView()
                cardImageView.layer.masksToBounds = true
                cardImageView.layer.cornerRadius = 6
                cardImageView.image = UIImage(named: "card-back")
                
                let cardLayout = NSLayoutConstraint(item: cardImageView, attribute: .height, relatedBy: .equal, toItem: cardImageView, attribute: .width, multiplier: (1.27 / 1.0), constant: 0)
                cardImageView.addConstraint(cardLayout)
                stackView.addArrangedSubview(cardImageView)
                
            }
        }
    }
    
