//
//  MainView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI

struct MainView: View {
  
  @StateObject
  var viewModel = MainViewModel()

  @Environment(\.colorScheme)
  var colorScheme
  
  init() {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = .systemGreen
    coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = colorScheme == .light ? .white : .white
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(colorScheme == .light ? UIColor.systemGreen : UIColor.systemGreen)
          .ignoresSafeArea()
        VStack {
          HStack {
            GoalTextView(water: viewModel.water, goal: viewModel.calPercent())
              .padding()
            Spacer()
          }
          CenterView(viewModel: viewModel)
        }
        .foregroundColor(colorScheme == .light ? Color.white : Color.white)
        .background(
          colorScheme == .light ? Color(UIColor.systemGreen) : Color(UIColor.systemGreen)
        )
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("물마시기")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(
              action: { viewModel.resetWater() },
              label: { Label("Refresh", systemImage: "arrow.clockwise") }
            )
              .foregroundColor(.white)
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(
              destination: { SettingView(viewModel: viewModel) },
              label: { Label("Refresh", systemImage: "person") }
            )
              .foregroundColor(.white)
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
