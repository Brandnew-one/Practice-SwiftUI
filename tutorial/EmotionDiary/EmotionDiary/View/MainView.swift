//
//  MainView.swift
//  EmotionDiary
//
//  Created by Bran on 2022/05/10.
//

import SwiftUI

// TODO: LazyVGrid 적용 시켜보기
struct MainView: View {
  @StateObject
  var viewModel = EmotionViewModel()

  @ViewBuilder
  private func emotionRowView(
    index: Int
  ) -> some View {
    HStack {
      EmotionView(
        emotionViewModel: viewModel,
        emtionImage: ImageSet(rawValue: index)!,
        emotionIndex: index
      )

      EmotionView(
        emotionViewModel: viewModel,
        emtionImage: ImageSet(rawValue: index + 1)!,
        emotionIndex: index + 1
      )

      EmotionView(
        emotionViewModel: viewModel,
        emtionImage: ImageSet(rawValue: index + 2)!,
        emotionIndex: index + 2
      )
    }
  }

  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          emotionRowView(index: 0)

          emotionRowView(index: 3)

          emotionRowView(index: 6)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("감정일기")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(
              action: {
                viewModel.showPopupView()
              },
              label: {
                Label("Refresh", systemImage: "arrow.clockwise")
                  .labelStyle(.iconOnly)
              }
            )
          }
        }

        PopupView(viewModel: viewModel)
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
