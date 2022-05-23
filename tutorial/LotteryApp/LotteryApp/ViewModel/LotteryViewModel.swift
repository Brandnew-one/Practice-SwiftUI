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

//  let apiService = APIService.shared

  func fetchLotteryInfo(pickedNo: String) {
    self.drwNo = pickedNo
    APIService.shared.requestLotteryWithResultType(drwNo: drwNo) { result in
      if case let .success(val) = result {
        self.lotteryInfo = val
      }
    }
  }
}
