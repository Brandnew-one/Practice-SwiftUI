//
//  LotteryViewModel.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import Foundation
import SwiftUI

class LotteryViewModel: ObservableObject {

  @Published
  var drwNo: String = ""

  @Published
  var lotteryInfo: Lottery = Lottery()

  let apiService = APIService()

  func fetchLotteryInfo() {
    apiService.requestLottery(drwNo: drwNo) { lottery in
      self.lotteryInfo = lottery
    }
  }

}
