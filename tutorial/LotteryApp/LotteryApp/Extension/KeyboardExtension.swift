//
//  KeyboardExtension.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/08.
//

import Foundation
import SwiftUI

extension UIApplication {
  func hideKeyboard() {
    guard let window = windows.first else { return }
    let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
    tapRecognizer.cancelsTouchesInView = false
    tapRecognizer.delegate = self
    window.addGestureRecognizer(tapRecognizer)
  }
}

extension UIApplication: UIGestureRecognizerDelegate {
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return false
  }
}

// MARK: 전역적으로 키보드를 대응하기 위함 (UIKit - AppDelegate)
