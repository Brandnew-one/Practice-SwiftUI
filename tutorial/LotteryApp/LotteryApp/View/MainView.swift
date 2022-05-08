//
//  MainView.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import SwiftUI

// TODO: DataPicker 추가
struct MainView: View {

  @State
  private var drwNo = ""

  @StateObject
  var viewModel = LotteryViewModel()

  @ViewBuilder
  func lotteryInfoLabel(date: String) -> some View {
    VStack {
      HStack {
        Text("당첨번호 안내")
          .font(.subheadline)

        Spacer()

        Text(date)
          .font(.footnote)
      }

      Divider()
        .frame(height: 1)
        .background(Color.black)
    }
    .padding([.top, .bottom])
    .padding(.leading, 8)
    .padding(.trailing, 8)
  }

  @ViewBuilder
  func lotteryNoLabel(drwNo: String) -> some View {
    HStack {
      Text("\(drwNo)회")
        .font(
          .system(
            size: 25,
            weight: .bold
          )
        )
        .foregroundColor(.orange)
      Text("당첨결과")
        .font(
          .system(
            size: 25,
            weight: .medium
          )
        )
    }
  }

  var body: some View {
    VStack(spacing: 0) {
      drwNoView(
        viewModel: viewModel,
        drwNo: $drwNo
      )
        .padding(.leading, 8)

      lotteryInfoLabel(date: viewModel.lotteryInfo.drwNoDate)

      lotteryNoLabel(drwNo: "\(viewModel.lotteryInfo.drwNo)")
        .padding(.bottom, 18)

      NumbersView(viewModel: viewModel)

      Spacer()

      PickerView(
        viewModel: viewModel,
        pickedValue: $drwNo
      )
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
