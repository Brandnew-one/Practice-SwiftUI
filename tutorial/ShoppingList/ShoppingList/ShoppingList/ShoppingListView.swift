//
//  ShoppingListView.swift
//  ShoppingList
//
//  Created by Bran on 2022/05/29.
//

import SwiftUI

struct ShoppingListView: View {
  @StateObject
  var viewModel: ShoppingListViewModel

  @State
  private var text: String = ""

  private let device = UIScreen.main.bounds

  var body: some View {
    VStack(spacing: 18) {
      HStack {
        TextField("구매할 상품을 입력하세요", text: $text)

        Button(
          action: {
            viewModel.addList(text)
            text = ""
          },
          label: {
            Text("추가")
              .foregroundColor(.black)
              .padding([.top, .bottom], 8)
              .padding([.leading, .trailing], 10)
              .background(Color(UIColor.systemGray3))
              .cornerRadius(15)
          }
        )
      }
      .padding()
      .frame(width: device.width * 0.9)
      .background(Color(UIColor.systemGray5))
      .cornerRadius(10)

      ScrollView {
        ForEach(viewModel.shoppingList) { item in
          HStack {
            Button(
              action: {
                viewModel.changeList(item, .checkBox)
              },
              label: {
                if item.checkBox {
                  Image(systemName: "checkmark.square.fill")
                } else {
                  Image(systemName: "checkmark.square")
                }
              }
            )

            Text(item.name)
              .multilineTextAlignment(.leading)

            Spacer()

            Button(
              action: {
                viewModel.changeList(item, .star)
              },
              label: {
                if item.star {
                  Image(systemName: "star.fill")
                } else {
                  Image(systemName: "star")
                }
              }
            )
          }
          .padding()
          .frame(width: device.width * 0.9)
          .background(
            Color(UIColor.systemGray5)
          )
          .cornerRadius(10)
        }
      }
    }
  }
}

struct ShoppingListView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingListView(viewModel: ShoppingListViewModel())
  }
}
