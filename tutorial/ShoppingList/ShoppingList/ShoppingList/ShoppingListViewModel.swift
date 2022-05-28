//
//  ShoppingListViewModel.swift
//  ShoppingList
//
//  Created by Bran on 2022/05/29.
//

import Foundation
import SwiftUI

// TODO: - AppStorage 적용 후 커스텀한 프로퍼티래퍼 적용해보기!
class ShoppingListViewModel: ObservableObject {
  private let userDefaultsKey = "ShoppingList"
  private let userDefaults = UserDefaults.standard

  @Published
  var shoppingList: [ShoppingListItem]?

  init() {
    loadList()
  }

  // MARK: - New Value
  func addList(_ item: ShoppingListItem) {
    guard let shoppingList = shoppingList else { return }
    if shoppingList.contains(item) { return }
    self.shoppingList?.append(item)
    userDefaults.setValue(try? PropertyListEncoder().encode(shoppingList), forKey: userDefaultsKey)
  }

  // MARK: - Modify Value
  func changeList(_ item: ShoppingListItem) {
    guard
      let shoppingList = shoppingList,
      let index = shoppingList.firstIndex(where: { $0 == item })
    else {
      print("Modify Value Fail")
      return
    }
    self.shoppingList![index] = item
    userDefaults.setValue(try? PropertyListEncoder().encode(shoppingList), forKey: userDefaultsKey)
  }

  // MARK: - Init value
  private func loadList() {
    guard
      let list = userDefaults.value(forKey: userDefaultsKey) as? Data,
      let decodeList = try? PropertyListDecoder().decode(Array<ShoppingListItem>.self, from: list)
    else {
      print("Load UserDefaults Error")
      return
    }
    self.shoppingList = decodeList
  }
}
