//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    var cardBacksideImage = UIImage()
    let trouble = TroubleShooter()
    let cardStackView = UIStackView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if cardStackView.subviews.count == 0 {
            do {
                self.view.backgroundColor = UIColor(patternImage: try optionalBindingImage(calledCard: "bg_pattern"))
                self.cardBacksideImage = try optionalBindingImage(calledCard: "card-back")
            }
            catch {
                print(error)
                present(trouble.personalError(), animated: true, completion: nil)
                //UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            }
            setStackView(cardStackView)
            addCard2StackView(cardCount: 7, stackView: cardStackView)
            setStackViewConstraints(stackView: cardStackView)
        }
        var testDeck = Deck.init()
        print(">","덱 초기화")
        print("총 \(testDeck.count())장의 카드가 있습니다.")
        print("Deck 내역 : ",testDeck)
        
        print(">","덱 섞기")
        testDeck.shuffle()
        print("총 \(testDeck.count())장의 카드를 섞었습니다.")
        print("Deck 내역 : ",testDeck)
        
        print(">","카드 하나 뽑기")
        print(testDeck.popOneCard())
        print("Deck 내역 : ",testDeck)
        
        print(">","카드 하나 뽑기")
        print(testDeck.popOneCard())
        print("Deck 내역 : ",testDeck)
        
        print(">","덱 리셋")
        testDeck.reset()
        print("Deck 내역 : ",testDeck)
    }
    
    private func testDeckMethods() {
        var testDeck = Deck.init()
        print(">","덱 초기화")
        print("총 \(testDeck.count())장의 카드가 있습니다.")
        print("Deck 내역 : ",testDeck)
        
        print(">","덱 섞기")
        testDeck.shuffle()
        print("총 \(testDeck.count())장의 카드를 섞었습니다.")
        print("Deck 내역 : ",testDeck)
        
        print(">","카드 하나 뽑기")
        print(testDeck.popOneCard())
        print("Deck 내역 : ",testDeck)
        
        print(">","카드 하나 뽑기")
        print(testDeck.popOneCard())
        print("Deck 내역 : ",testDeck)
        
        print(">","덱 리셋")
        testDeck.reset()
        print("Deck 내역 : ",testDeck)
    }
    
    private func addCard2StackView( cardCount : Int ,stackView : UIStackView) {
        for _ in 0..<cardCount {
            stackView.addArrangedSubview(generatingBacksideOfCard())
        }
    }
    
    private func setStackViewConstraints(stackView : UIStackView) {
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setStackView(_ stackView : UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
    }
    
    private func optionalBindingImage(calledCard : String) throws -> UIImage {
        guard let image = UIImage(named: calledCard) else {
            throw TroubleShooter.errors.imageOptionalBindingError
        }
        return image
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    private func generatingBacksideOfCard() -> UIImageView {
        let imageView = UIImageView(image: self.cardBacksideImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
}

