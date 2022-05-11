//
//  PopupView.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/11.
//

import SwiftUI

struct PopupView: View {
  @ObservedObject
  var viewModel: EmotionViewModel

  @ViewBuilder
  func buttonRow() -> some View {
    HStack(alignment: .center, spacing: 10) {
      Button(
        action: { viewModel.isHidden = true },
        label: {
          Text("취소")
            .foregroundColor(.red)
        }
      )

      Divider()
    // FIXME: Reset이후 뷰가 업데이트 되지 않는 문제
      Button(
        action: {
          viewModel.resetEmotionNumbers()
          viewModel.isHidden = true
        },
        label: {
          Text("확인")
            .foregroundColor(.blue)
        }
      )
    }
  }

  // FIXME: 팝업뷰 뷰 디자인 변경필요
  var body: some View {
    if viewModel.isHidden {
      EmptyView()
    } else {
      ZStack {
        Color.black.opacity(0.3)
          .ignoresSafeArea()

        VStack(spacing: 2) {
          Text("초기화 하시겠습니까?")
            .font(.body)

          Divider()
            .frame(height: 1)
            .background(Color.blue)

          Text("확인 버튼을 누르면 초기화됩니다.")
            .font(.body)

          Divider()
            .frame(height: 1)
            .background(Color.blue)

          buttonRow()
        }
        .background(Color.white)
        .frame(width: 250, height: 100)
      }
    }
  }
}

struct PopupView_Previews: PreviewProvider {
  static var previews: some View {
    PopupView(viewModel: EmotionViewModel())
  }
}
