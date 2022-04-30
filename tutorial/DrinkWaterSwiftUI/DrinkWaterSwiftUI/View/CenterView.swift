//
//  CenterView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI

// MARK: Center 이미지 및 버튼까지
struct CenterView: View {
  
  @State
  private var unitWater: String = "100"

  var totalWater = 0
  let deviceWidth = UIScreen.main.bounds.width
  
  @ObservedObject
  var viewModel: MainViewModel
  
  init(viewModel: MainViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack(spacing: 18) {
      Spacer()
      viewModel.setImage()
        .resizable()
        .frame(width: deviceWidth * 0.65, height: deviceWidth * 0.65)
        .clipShape(Circle())
        .shadow(radius: 3)
      
      HStack(spacing: 5) {
        TextField("\(unitWater)", text: $unitWater)
          .frame(width: 50) // font 크기에 따라 설정하는법?
          .font(.title2)
          .keyboardType(.numberPad)
        Text("ml")
          .font(.title2)
      }
      
      Button(
        action: { viewModel.drinkButtonClicked(unitWater: Int(unitWater) ?? 0) },
        label: {
          Text("물마시기")
            .font(.body)
        }
      )
      Spacer()
      Text("\(viewModel.name ?? "닉네임")님의 하루 물 권장 섭취량은 \(viewModel.calGoalWater())ml입니다.")
        .font(.footnote)
    }
    .onAppear(perform: UIApplication.shared.hideKeyboard)
//    .background(Color(UIColor.systemGreen))
  }
}
