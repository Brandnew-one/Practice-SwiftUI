//
//  PopupView.swift
//  PopupView
//
//  Created by Bran on 2022/05/08.
//

import SwiftUI

struct PopupView: View {
  @ObservedObject
  var viewModel: PopupViewModel

  var body: some View {
    if viewModel.isHidden {
      EmptyView()
    } else {
      ZStack {
        Color.black.opacity(0.3)

        VStack(spacing: 0) {
          Text("팝업뷰입니다.")
            .font(.title)
            .foregroundColor(.white)
            .background(.red)

          Divider()
            .frame(height: 1)
            .background(Color.white)

          Text("Empty View 일 때는 ZStack으로 먹여도 클릭이 가능한 상태구나")
            .multilineTextAlignment(.center)
            .font(.system(
              size: 16,
              weight: .semibold
            ))
            .foregroundColor(.white)
            .background(.red)

          Divider()
            .frame(height: 1)
            .background(Color.white)

          Button(
            action: {
              viewModel.isHidden = true
            },
            label: {
              Text("OK")
            }
          )
          .foregroundColor(.white)
          .background(.red)
        }
        .background(.red)
      }
    }
  }
}

struct PopupView_Previews: PreviewProvider {
  static var previews: some View {
    PopupView(viewModel: PopupViewModel())
  }
}
