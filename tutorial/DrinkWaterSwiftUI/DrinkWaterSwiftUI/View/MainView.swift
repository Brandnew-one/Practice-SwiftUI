//
//  MainView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI


struct MainView: View {
  
  init() {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = .systemGreen
    coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    
    //    UINavigationBar.appearance().standardAppearance = coloredAppearance
    //    UINavigationBar.appearance().compactAppearance = coloredAppearance
    
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = .white
  }
  
  var body: some View {
    NavigationView {
      VStack {
        HStack {
          GoalTextView(water: 1200, goal: 67)
            .padding()
          Spacer()
        }
        CenterView()
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("물마시기")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(
            action: { print("refresh") },
            label: { Label("Refresh", systemImage: "arrow.clockwise") }
          )
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          NavigationLink(
            destination: { SettingView() },
            label: { Label("Refresh", systemImage: "person") }
          )
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
