//
//  PopupView.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/11.
//

import SwiftUI

// https://exyte.com/blog/swiftui-tutorial-popupview-library
// TODO: 팝업 라이브러리 코드 분석해서 적용시키기
struct PopupView: View {
  @ObservedObject
  var viewModel: EmotionViewModel

  let device = UIScreen.main.bounds

  @ViewBuilder
  private func roundButton(
    text: String,
    color: Color,
    action: @escaping () -> Void
  ) -> some View {
    Button(
      action: action,
      label: {
        Text(text)
          .foregroundColor(color)
          .padding()
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(color, lineWidth: 2)
          )
      }
    )
  }

  @ViewBuilder
  private func buttonRow() -> some View {
    HStack(alignment: .center, spacing: 10) {
      Spacer()

      roundButton(
        text: "취소",
        color: .red) {
          viewModel.isHidden = true
        }

      Spacer()

      roundButton(
        text: "확인",
        color: .blue) {
          viewModel.resetEmotionNumbers()
          viewModel.isHidden = true
        }

      Spacer()
    }
  }

  var body: some View {
    if viewModel.isHidden {
      EmptyView()
    } else {
      ZStack {
        Color.black.opacity(0.3)
          .ignoresSafeArea()

        VStack(spacing: 0) {
          Text("확인 버튼을 눌러서 감정일기를 초기화 할 수 있어요!")
            .font(.body)
            .layoutPriority(1)
            .multilineTextAlignment(.center)
            .padding()

          buttonRow()
        }
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 2)
        )
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(.white)
        )
        .frame(width: device.width * 0.7)
      }
    }
  }
}

struct PopupView_Previews: PreviewProvider {
  static var previews: some View {
    PopupView(viewModel: EmotionViewModel())
  }
}
