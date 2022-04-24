//
//  GoalTextView.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/23.
//

import SwiftUI

// MARK: 좌측상단 목표 수분 섭취량 표현 뷰
struct GoalTextView: View {
  var waterDrunk: Int
  var goalPercent: Int
  
  init(water: Int, goal: Int) {
    self.waterDrunk = water
    self.goalPercent = goal
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("잘하셨어요!")
        .font(.title2)
      Text("오늘 마신 양은")
        .font(.title2)
      Text("\(waterDrunk)ml")
        .font(.title)
      Text("목표의 \(goalPercent)%")
        .font(.subheadline)
    }
//    .background(Color(UIColor.systemGreen))
  }
}

struct GoalTextView_Previews: PreviewProvider {
  static var previews: some View {
    GoalTextView(water: 2000, goal: 65)
  }
}
