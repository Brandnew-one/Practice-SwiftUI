//
//  ShoppingListCell.swift
//  ShoppingList
//
//  Created by Bran on 2022/05/29.
//

import SwiftUI

struct ShoppingListCell: View {
  @State
  var shoppingListItem: ShoppingListItem

  var body: some View {
    HStack {
      Button(
        action: {
          shoppingListItem.checkBox.toggle()
          print(shoppingListItem.checkBox)
        },
        label: {
          if shoppingListItem.checkBox {
            Image(systemName: "checkmark.square.fill")
          } else {
            Image(systemName: "checkmark.square")
          }
        }
      )

      Text(shoppingListItem.name)

      Button(
        action: {
          shoppingListItem.star.toggle()
          print(shoppingListItem.star)
        },
        label: {
          if shoppingListItem.star {
            Image(systemName: "star.fill")
          } else {
            Image(systemName: "star")
          }
        }
      )
    }
    .padding()
    .background(Color.gray)
  }
}

struct ShoppingListCell_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingListCell(shoppingListItem: ShoppingListItem(
      checkBox: false,
      star: false,
      name: "TEST VALIDATION"
    ))
  }
}
