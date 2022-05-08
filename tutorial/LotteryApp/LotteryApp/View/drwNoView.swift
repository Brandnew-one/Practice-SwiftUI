//
//  drwNoView.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import SwiftUI

// TODO: Int로 변경 불가능한 타입이 왔을 경우 대응
struct drwNoView: View {
  @ObservedObject
  var viewModel: LotteryViewModel

  @Binding
  var drwNo: String

  @Environment(\.colorScheme)
  var scheme

  @ViewBuilder
  func textFieldLabel(str: Binding<String>) -> some View {
    TextField(
      "회차를 입력하세요",
      text: str
    )
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 10)
      .stroke(
        Theme.myTextColor(scheme: scheme),
        lineWidth: 1
      )
    )
    .keyboardType(.numberPad)
    .onAppear(
      perform: UIApplication.shared.hideKeyboard
    )
  }

  var body: some View {
    HStack(spacing: 8) {
      textFieldLabel(str: $drwNo)

      Button(
        action: {
          viewModel.fetchLotteryInfo(pickedNo: drwNo)
        }) {
          VStack {
            Image(systemName: "heart.fill")
            Text("확인")
          }
          .foregroundColor(Theme.myTextColor(scheme: scheme))
          .padding()
        }
    }
  }
}

struct drwNoView_Previews: PreviewProvider {

  static var previews: some View {
    drwNoView(
      viewModel: LotteryViewModel(),
      drwNo: .constant("") // 고정값으로 확인가능
    )
  }
}
