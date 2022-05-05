//
//  NumbersView.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import SwiftUI

struct NumbersView: View {

  @ObservedObject
  var viewModel: LotteryViewModel

  @ViewBuilder
  func numberLabel(number: String) -> some View {
    ZStack {
      Circle()
        .strokeBorder(
          Color.random,
          lineWidth: 2
        )
        .frame(width: 35, height: 35)

      Text(number)
        .font(.title3)
    }
  }

  // TODO: VStack으로 보너스 추가하기!
  var body: some View {
    HStack(spacing: 8) {
      numberLabel(number: "\(viewModel.lotteryInfo.drwtNo1)")

      numberLabel(number: "\(viewModel.lotteryInfo.drwtNo2)")

      numberLabel(number: "\(viewModel.lotteryInfo.drwtNo3)")

      numberLabel(number: "\(viewModel.lotteryInfo.drwtNo4)")

      numberLabel(number: "\(viewModel.lotteryInfo.drwtNo5)")

      numberLabel(number: "\(viewModel.lotteryInfo.drwtNo6)")

      Text("+")
        .font(.title2)

      numberLabel(number: "\(viewModel.lotteryInfo.bnusNo)")
    }
  }
}

struct NumbersView_Previews: PreviewProvider {
  static var previews: some View {
    NumbersView(viewModel: LotteryViewModel())
  }
}
