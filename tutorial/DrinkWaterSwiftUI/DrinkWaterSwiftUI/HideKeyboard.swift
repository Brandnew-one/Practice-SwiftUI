//
//  HideKeyboard.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/30.
//

import Foundation
import SwiftUI

// MARK: 키보드 대응
// https://stackoverflow.com/questions/56491386/how-to-hide-keyboard-when-using-swiftui
// https://seons-dev.tistory.com/160

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
