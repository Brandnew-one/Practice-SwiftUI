//
//  PopupViewModel.swift
//  PopupView
//
//  Created by Bran on 2022/05/08.
//

import Foundation
import SwiftUI

class PopupViewModel: ObservableObject {
  @Published
  var isHidden: Bool = true
}
