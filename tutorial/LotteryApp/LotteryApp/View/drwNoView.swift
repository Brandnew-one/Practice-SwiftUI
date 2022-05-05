//
//  drwNoView.swift
//  LotteryApp
//
//  Created by Bran on 2022/05/05.
//

import SwiftUI

// FIXME: 텍스트필드 값 바뀔 때 마다 색깔 바뀌는게 너무 정신 사나움
// FIXME: 그냥 버튼 누를때만 바뀌도록 수정
struct drwNoView: View {

  @ObservedObject
  var viewModel: LotteryViewModel

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
        Color.black,
        lineWidth: 1
      )
    )
  }

  var body: some View {
    HStack(spacing: 8) {
      textFieldLabel(str: $viewModel.drwNo)

      Button(
        action: {
          viewModel.fetchLotteryInfo()
        }) {
          VStack {
            Image(systemName: "heart.fill")
            Text("확인")
          }
          .foregroundColor(.black)
          .padding()
        }
    }
  }
}

struct drwNoView_Previews: PreviewProvider {
  static var previews: some View {
    drwNoView(viewModel: LotteryViewModel())
  }
}
