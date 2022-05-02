//
//  ContentView.swift
//  RGBGame
//
//  Created by Bran on 2022/05/02.
//

import SwiftUI

struct ColorSlider: View {
  @Binding
  var value: Double
  var trackColor: Color

  var body: some View {
    HStack {
      Text("0")
      Slider(value: $value)
        .accentColor(trackColor)
      Text("255")
    }
    .padding([.leading, .trailing])
  }
}

struct ColorCircle: View {
  var rgb: RGB

  var body: some View {
    Circle()
      .fill(Color(rgbStruct: rgb))
  }
}

struct ContentView: View {
  @State
  var game = Game()

  @State
  var guess: RGB

  @State
  var showCase = false

  var body: some View {
    VStack {
      ColorCircle(rgb: game.target)
      if showCase {
        Text(game.target.intString)
          .padding()
      } else {
        Text("R: ??? G: ??? B: ???")
          .padding()
      }

      ColorCircle(rgb: guess)
      Text(guess.intString)
        .padding()

      ColorSlider(value: $guess.red, trackColor: .red)
      ColorSlider(value: $guess.green, trackColor: .green)
      ColorSlider(value: $guess.blue, trackColor: .blue)

      Button(
        action: {
          showCase = true
          game.check(guess: guess)
        }) {
          Text("Hit me")
        }
        .alert(isPresented: $showCase) {
          Alert(
            title: Text("Your Score"),
            message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK")) {
              game.startNewRound() // game 초기화(랜덤)
              guess = RGB() // guess 초기화
            })
        }
      //Alert이 dismiss 되면서 바인딩된 값을 자동으로 false로 설정
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      guess: RGB()
    )
  }
}


