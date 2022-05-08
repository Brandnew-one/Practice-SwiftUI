//
//  LotteryViewModel.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import Foundation
import SwiftUI

// TODO: 최신회차 정보를 바로 배열에 추가할 수 있도록 업데이트 하기
class LotteryViewModel: ObservableObject {

  @Published
  var drwNo: String = ""

  @Published
  var lotteryInfo: Lottery = Lottery()

  let apiService = APIService()

  func fetchLotteryInfo(pickedNo: String) {
    self.drwNo = pickedNo
    apiService.requestLottery(drwNo: drwNo) { lottery in
      self.lotteryInfo = lottery
    }
  }
}
