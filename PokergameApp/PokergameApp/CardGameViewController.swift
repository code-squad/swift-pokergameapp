//
//  ViewController.swift
//  PokergameApp
//
//  Created by hw on 14/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {
    private var dataController: DataController!
    
    private var cardGameSizeInfo = CardGameSizeInfo()
    private var initialRectSize = InitialRectSize()
    private var stackViewSizeInfo = StackViewSizeInfo()
    private var segmentControlsSizeInfo = SegmentControlsSizeInfo()
    private var playButtonSizeInfo = PlayButtonSizeInfo()
    private let verticalConstant: CGFloat = 200
    private lazy var uiLabelList = [UILabel]()
    private lazy var stackviewList = [UIStackView]()

    private lazy var gameTypeSegmentedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
    private lazy var playerTypeSementedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
    private lazy var playButton: UIButton = UIButton.init(frame: initialRectSize.basicCGRect)
    var height: CGFloat {
        return CGFloat((stackViewSizeInfo.width-stackViewSizeInfo.marginSpace * CGFloat(cardGameSizeInfo.cardSize))
            / CGFloat(cardGameSizeInfo.cardSize)) * cardGameSizeInfo.ratio
    }
    
    private struct CardGameSizeInfo {
        var cardSize = 7
        var playerSize = 5
        let ratio: CGFloat = 1.27
    }
    private struct StackViewSizeInfo {
        let widthProportion: CGFloat = 0.1
        let marginSpace: CGFloat = 0
        var width: CGFloat = 0
        var leftAlign: CGFloat = -20
        var spacingSize: CGFloat = -10
    }
    
    struct SegmentControlsSizeInfo {
        let xCoordinate: CGFloat = 126
        let yCoordinateFirst: CGFloat = 100
        let yCoordinateSecond: CGFloat = 150
        let width: CGFloat = 160
        let height: CGFloat = 30
    }
    struct PlayButtonSizeInfo {
        let xCoordinate: CGFloat = 120
        let yCoordinateFirst: CGFloat = 50
        let width: CGFloat = 160
        let height: CGFloat = 30
        let backgroundColor: UIColor = .cyan
        let tintColor: UIColor = .red
    }
    private struct InitialRectSize {
        var basicCGRect: CGRect = CGRect.init(x: 1, y: 1, width: 100, height: 30)
    }
    func configureData(_ dataController: DataController) {
        self.dataController = dataController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundPatternImage()

        updateStackViewWidthSize()
        gameTypeSegmentedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
        playerTypeSementedControl = UISegmentedControl.init(frame: initialRectSize.basicCGRect)
        
        setButton()
        setSegmentedControls()
        setDefaultStackviewListBySettings()
        
        addSegmentedControlTargetActionHandlers()
        addNotificationObservers()
    }
    
    private func updateStackViewWidthSize() {
        stackViewSizeInfo.width = view.frame.width * stackViewSizeInfo.widthProportion
            * CGFloat(cardGameSizeInfo.cardSize)
    }
    private func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateWinner), name: .notifyWinner, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCardList), name: .updateCardList, object: nil)
    }
    
    @objc func updateCardList(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: [Player]],
            let players = userInfo["players"] as? [Player] else {
            displayAlertInplace(.systemError)
            return
        }
        let format = { (name: String, hand: Hand) in
            print("\(name):", terminator: " ")
            let innerFormat = { (deck: [Card]) in
                deck.forEach({ (card) in
                    print(card.description, terminator: " ")
                })
            }
            hand.printFormat(format: innerFormat)
            print()
        }
        players.forEach { (player) in
            player.receivePrintFormat(format)
        }
    }
    
    @objc func updateWinner(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: GameWinner],
            let winner = userInfo["result"] else {
            displayAlertInplace(.systemError)
            return
        }
        updateMedalNextToWinnerDeck(winner)
    }
    private func updateMedalNextToWinnerDeck(_ winner: GameWinner){
        
    }
    private func addSegmentedControlTargetActionHandlers(){
        addPlayCardGameButtonHandler()
        addPlayerTypeSegmentedControlHandler()
        addGameTypeSegmentedControlHandler()
    }
    
    private func addPlayerTypeSegmentedControlHandler(){
        playerTypeSementedControl.addTarget(self,
                                            action: #selector(updatePlayerTypeInfoToStackView),
                                            for: .valueChanged )
    }
    
    @objc func updatePlayerTypeInfoToStackView(){
        if checkAllControlsSelected(){
            guard let currentPlayerType = retrivePlayerTypeFromSegmentedControl() else { return }
            guard let currentGameType = retriveGameTypeFromSegmentedControl() else { return }
            cardGameSizeInfo.cardSize = currentGameType.rawValue
            cardGameSizeInfo.playerSize = currentPlayerType.rawValue
            setDefaultStackviewListBySettings()
        }
        else if isPlayerTypeSegmentedControlSelected() {
            guard let currentPlayerType = retrivePlayerTypeFromSegmentedControl() else { return }
            cardGameSizeInfo.playerSize = currentPlayerType.rawValue
            setDefaultStackviewListBySettings()
        }
    }
    
    private func addGameTypeSegmentedControlHandler(){
        gameTypeSegmentedControl.addTarget(self, action: #selector(updateGameTypeInfoToStackView), for: .valueChanged)
    }
    
    @objc func updateGameTypeInfoToStackView(){
        if checkAllControlsSelected(){
            guard let currentPlayerType = retrivePlayerTypeFromSegmentedControl() else { return }
            guard let currentGameType = retriveGameTypeFromSegmentedControl() else { return }
            cardGameSizeInfo.cardSize = currentGameType.rawValue
            cardGameSizeInfo.playerSize = currentPlayerType.rawValue
            stackViewSizeInfo.width = view.frame.width * stackViewSizeInfo.widthProportion
            setDefaultStackviewListBySettings()
        }
        else if isGameTypeSegmentedControlSelected() {
            guard let currentGameType = retriveGameTypeFromSegmentedControl() else { return }
            cardGameSizeInfo.cardSize = currentGameType.rawValue
            setDefaultStackviewListBySettings()
        }
    }
    
    private func removeCurrentStackViews(){
        stackviewList.forEach { (stackview) in
            stackview.removeFromSuperview()
        }
        stackviewList.removeAll()
    }
    
    private func addPlayCardGameButtonHandler(){
        playButton.addTarget(self, action: #selector(playGame), for: .touchUpInside)
    }
    
    @objc func playGame(){
        if checkAllControlsSelected() {
            guard let currentPlayerType = retrivePlayerTypeFromSegmentedControl() else { return }
            guard let currentGameType = retriveGameTypeFromSegmentedControl() else { return }
            dataController.play(playerType: currentPlayerType, gameType: currentGameType)
        }
    }
    
    private func retrivePlayerTypeFromSegmentedControl() -> PlayerType? {
        guard let playerType = playerTypeSementedControl.titleForSegment(at:
            playerTypeSementedControl.selectedSegmentIndex) else {
                return nil
        }
        guard let currentPlayerType = try? PlayerType.init(playerType) else { return nil}
        return currentPlayerType
    }
    
    private func retriveGameTypeFromSegmentedControl() -> GameType?  {
        guard let gameType = gameTypeSegmentedControl.titleForSegment(at:
            gameTypeSegmentedControl.selectedSegmentIndex) else {
                return nil
        }
        guard let currentGameType = try? GameType.init(gameType) else { return nil }
        return currentGameType
    }
    
    private func isPlayerTypeSegmentedControlSelected() -> Bool {
        if playerTypeSementedControl.selectedSegmentIndex == -1 {
            displayAlertInplace(.selectedGamePlayersAbsence)
            return false
        }
        return true
    }
    
    private func isGameTypeSegmentedControlSelected() -> Bool {
        if gameTypeSegmentedControl.selectedSegmentIndex == -1 {
            displayAlertInplace(.selectedGameTypeAbsence)
            return false
        }
        return true
    }
    
    private func checkAllControlsSelected() -> Bool {
        return isPlayerTypeSegmentedControlSelected() && isGameTypeSegmentedControlSelected()
    }
    
    private func displayAlertInplace(_ error: GameMenuError) {
        let alert = UIAlertController(title: "알림", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
        let errorConfirmAction = UIAlertAction(title:"확인", style: .default, handler: nil)
        alert.addAction(errorConfirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func setDefaultStackviewListBySettings(){
        updateStackViewWidthSize()
        removeCurrentStackViews()
        let numberOfPlayer = cardGameSizeInfo.playerSize
        for _ in 0..<numberOfPlayer {
            let rect = CGRect(x: 0, y: 0, width: stackViewSizeInfo.width, height: height)
            let stackview = UIStackView.init(frame: rect)
            stackviewList.append(stackview)
        }
        setImageViewsInStackViewList(stackviewList)
        addStackViewList(stackviewList)
        setConstraintOfStackViewList(stackviewList)
    }
    
    private func setImageViewsInStackViewList(_ list: [UIStackView]){
        for index in 0..<list.endIndex{
            addImageViewsInStackView(list[index], order: index)
        }
    }
    
    private func setConstraintOfStackViewList(_ list: [UIStackView]){
        var constraintList = [NSLayoutConstraint]()
        for index in 0..<list.endIndex{
            let eachDefaultConstraints = setStackviewDefaultConstraints(list[index], order: index)
            eachDefaultConstraints.forEach { (eachNSLayoutConstraint) in
                constraintList.append(eachNSLayoutConstraint)
            }
        }
        let firstStackView = list[0]
        let firstStackViewConstraints = setFirstStackViewConstraints(firstStackView)
        firstStackViewConstraints.forEach { (constraint) in
            constraintList.append(constraint)
        }
        setRestStackViewAdditionalConstraints(list).forEach { (constraint) in
            constraintList.append(constraint)
        }
        NSLayoutConstraint.activate(constraintList)
    }
    
    private func setRestStackViewAdditionalConstraints(_ list: [UIStackView]) -> [NSLayoutConstraint]{
        var verticalSpacingConstraintList: [NSLayoutConstraint] = []
        for index in 1..<list.endIndex{
            let currentStackView = list[index]
            let previousStackView = list[index-1]
            let verticalSpacingConstraint = NSLayoutConstraint.init(item: currentStackView, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: previousStackView, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: height)
            verticalSpacingConstraintList.append(verticalSpacingConstraint)
        }
        return verticalSpacingConstraintList
    }
    
    private func setFirstStackViewConstraints(_ firstStackView: UIStackView) -> [NSLayoutConstraint]{
        let initialViewVerticalConstraint = NSLayoutConstraint.init(item: firstStackView, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: playerTypeSementedControl, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: height)
        let horizontalConstraint = NSLayoutConstraint.init(item: firstStackView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: firstStackView.superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: stackViewSizeInfo.leftAlign)
        return [initialViewVerticalConstraint, horizontalConstraint]
    }
    
    private func setStackviewDefaultConstraints(_ stackview: UIStackView, order: Int) -> [NSLayoutConstraint]{
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = stackViewSizeInfo.spacingSize
        let horizontalConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: stackViewSizeInfo.leftAlign)
        let widthConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: stackViewSizeInfo.width)
        let heightConstraint = NSLayoutConstraint.init(item: stackview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackview.superview, attribute:  NSLayoutConstraint.Attribute.height, multiplier: 0, constant: height)
        return [horizontalConstraint, widthConstraint, heightConstraint] //horizontalConstraint, verticalConstraint,
    }

    private func addStackViewList(_ list: [UIStackView]){
        list.forEach { (stackview) in
            view.addSubview(stackview)
        }
    }
    
    private func setButton(){
        let playButtonRectSize = CGRect.init(x: playButtonSizeInfo.xCoordinate,
                                             y: playButtonSizeInfo.yCoordinateFirst,
                                             width: playButtonSizeInfo.width,
                                             height: playButtonSizeInfo.height)
        playButton = UIButton.init(frame: playButtonRectSize)
        playButton.tintColor = playButtonSizeInfo.tintColor
        playButton.backgroundColor = playButtonSizeInfo.backgroundColor
        playButton.setTitle("Play", for: .normal)
        view.addSubview(playButton)
    }
    
    private func setSegmentedControls(){
        setGameTypeSegmentedControl()
        setPlayerTypeSegmentedControlRectSize()
        view.addSubview(gameTypeSegmentedControl)
        view.addSubview(playerTypeSementedControl)
    }
    
    private func setGameTypeSegmentedControl() {
        let gameTypeSegmentedControlRectSize = createGameTypeSegmentedControlRectSize()
        gameTypeSegmentedControl = UISegmentedControl.init(frame: gameTypeSegmentedControlRectSize)
        gameTypeSegmentedControl.tintColor = .white
        gameTypeSegmentedControl.backgroundColor = .black
        gameTypeSegmentedControl.insertSegment(withTitle: GameType.fiveCard.description, at: 0, animated: true)
        gameTypeSegmentedControl.insertSegment(withTitle: GameType.sevenCard.description, at: 0, animated: true)
    }
    
    private func setPlayerTypeSegmentedControlRectSize(){
        let playerTypeSegmentedControlRectSize = createPlayerTypeSegmentedControlRectSize()
        playerTypeSementedControl = UISegmentedControl.init(frame: playerTypeSegmentedControlRectSize)
        playerTypeSementedControl.tintColor = .white
        playerTypeSementedControl.backgroundColor = .black
        playerTypeSementedControl.insertSegment(withTitle: PlayerType.four.description, at: 0, animated: true)
        playerTypeSementedControl.insertSegment(withTitle: PlayerType.three.description, at: 0, animated: true)
        playerTypeSementedControl.insertSegment(withTitle: PlayerType.two.description, at: 0, animated: true)
    }
    
    private func createGameTypeSegmentedControlRectSize() -> CGRect {
        return  CGRect.init(x: segmentControlsSizeInfo.xCoordinate,
                            y: segmentControlsSizeInfo.yCoordinateFirst,
                            width: segmentControlsSizeInfo.width,
                            height: segmentControlsSizeInfo.height)
    }
    
    private func createPlayerTypeSegmentedControlRectSize() -> CGRect {
        return CGRect.init(x: segmentControlsSizeInfo.xCoordinate,
                           y: segmentControlsSizeInfo.yCoordinateSecond,
                           width: segmentControlsSizeInfo.width,
                           height: segmentControlsSizeInfo.height)
    }
    
    private func setBackgroundPatternImage(){
        guard let backgroundPatternImage = UIImage.init(named: "\(ImageInfo.background)") else {
            return
        }
        view.backgroundColor = UIColor.init(patternImage: backgroundPatternImage)
    }
    
    private func addImageViewsInStackView(_ stackview: UIStackView, order: Int){
        let imageWidth = (initialRectSize.basicCGRect.width - stackViewSizeInfo.marginSpace
            * CGFloat(cardGameSizeInfo.cardSize))/CGFloat(cardGameSizeInfo.cardSize)
        let imageHeight = height
        for _ in 0..<cardGameSizeInfo.cardSize  {
            let currentCardRect = CGRect.init(x: 0, y: 0, width: imageWidth, height: imageHeight)
            let uiImageView = UIImageView.init(frame: currentCardRect)
            uiImageView.image = UIImage.init(named: ImageInfo.cardBack)
            stackview.addArrangedSubview(uiImageView)
        }
        stackview.distribution = .fillEqually
        stackview.spacing = stackViewSizeInfo.marginSpace
    }
    
 
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

