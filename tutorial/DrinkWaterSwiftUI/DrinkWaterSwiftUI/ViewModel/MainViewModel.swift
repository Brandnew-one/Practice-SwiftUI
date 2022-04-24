//
//  MainViewModel.swift
//  DrinkWaterSwiftUI
//
//  Created by 신상원 on 2022/04/24.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published
  var name: String? = UserDefaults.standard.string(forKey: UserDefaultKey.name)
  @Published
  var height: Double? = UserDefaults.standard.double(forKey: UserDefaultKey.height)
  @Published
  var weight: Double? = UserDefaults.standard.double(forKey: UserDefaultKey.weight)
  @Published
  var water: Int = UserDefaults.standard.integer(forKey: UserDefaultKey.water)
  
  func resetWater() {
    water = 0
    UserDefaults.standard.set(water, forKey: UserDefaultKey.water)
  }
  
  func drinkButtonClicked(unitWater: Int) {
    water += unitWater
    UserDefaults.standard.set(water, forKey: UserDefaultKey.water)
    setImage()
  }
  
  func calGoalWater() -> Int {
    guard let height = height,
          let weight = weight
    else {
      print("UserDefault 값 없음")
      return 0
    }
    return Int((height + weight) * 10)
  }
  
  func calPercent() -> Int {
    let goalWater = calGoalWater()
    if goalWater == 0 {
      return 0
    } else {
      return Int((Double(water) / Double(goalWater)) * 100)
    }
  }
  
  func setImage() -> Image{
    var percent = calPercent()
    if percent < 20 {
      return Image("1-1")
    }
    else if percent >= 20 && percent < 30 {
      return Image("1-2")
    }
    else if percent >= 30 && percent < 40 {
      return Image("1-3")
    }
    else if percent >= 40 && percent < 50 {
      return Image("1-4")
    }
    else if percent >= 50 && percent < 60 {
      return Image("1-5")
    }
    else if percent >= 60 && percent < 70 {
      return Image("1-6")
    }
    else if percent >= 70 && percent < 80 {
      return Image("1-7")
    }
    else if percent >= 80 && percent < 90 {
      return Image("1-8")
    }
    else {
      return Image("1-9")
    }
  }
  
  func saveButtonClicked(name: String, height: String, weight: String) {
    guard let height = Double(height),
          let weight = Double(weight)
    else {
      print("잘못된 형식입니다.") // 얼럿으로 적용
      return
    }
    print(name, height, weight)
    
    self.name = name
    UserDefaults.standard.set(name, forKey: UserDefaultKey.name)
    self.height = height
    UserDefaults.standard.set(height, forKey: UserDefaultKey.height)
    self.weight = weight
    UserDefaults.standard.set(weight, forKey: UserDefaultKey.weight)
    
    print(
      "UserDefault Values",
      UserDefaults.standard.string(forKey: UserDefaultKey.name),
      UserDefaults.standard.double(forKey: UserDefaultKey.height),
      UserDefaults.standard.double(forKey: UserDefaultKey.weight)
    )
    
    print(
      "ViewModel Values",
      self.name,
      self.height,
      self.weight
    )
  }
  
}
