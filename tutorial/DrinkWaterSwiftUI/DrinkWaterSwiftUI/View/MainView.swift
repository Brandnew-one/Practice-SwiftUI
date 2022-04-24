//
//  MainView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI

// TODO: 탭제스쳐를 넣으면 네비게이션 아이템이 동작하지 않는 문제
// TODO: 다크모드 대응(https://seons-dev.tistory.com/176)
//    .foregroundColor(Color(uiColor: .systemGreen)) // iOS 15
struct MainView: View {
  
  @StateObject
  var viewModel = MainViewModel()
  
  init() {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = .systemGreen
    coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = .white
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(UIColor.systemGreen)
          .ignoresSafeArea()
        VStack {
          HStack {
            GoalTextView(water: viewModel.water, goal: viewModel.calPercent())
              .padding()
            Spacer()
          }
          CenterView(viewModel: viewModel)
        }
        .foregroundColor(Color.white)
        .background(Color(UIColor.systemGreen))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("물마시기")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(
              action: { viewModel.resetWater() },
              label: { Label("Refresh", systemImage: "arrow.clockwise") }
            )
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(
              destination: { SettingView(viewModel: viewModel) },
              label: { Label("Refresh", systemImage: "person") }
            )
          }
      }
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
      MainView()
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
