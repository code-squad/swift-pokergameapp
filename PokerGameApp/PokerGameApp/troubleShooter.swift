//
//  troubleShooter.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/16.
//

import Foundation
import UIKit

class TroubleShooter {
    enum errors : Error {
        case imageOptionalBindingError
    }
    
    func personalError() -> UIAlertController {
        
        let alert = UIAlertController(title: "치명적 오류 발생", message: nil, preferredStyle: .actionSheet)
        let stop = UIAlertAction(title: "앱 정지", style: .destructive, handler: {(action) in self.suspendApp()})
        
        alert.addAction(stop)
        return alert
    }
    
    private func suspendApp(){
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)

    }
}
