//
//  NewlyWordManager.swift
//  NewlyWord
//
//  Created by Bran on 2022/05/21.
//

import Foundation
import OSLog

public class NewlyWordManager {
  public var newlyWordDic: [String : String] = [:]

  public init(csv fileName: String) {
    loadCSV(fileName: fileName)
  }

  fileprivate func loadCSV(fileName: String) {
    guard
      let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") else {
      os_log(.error, "Can't find CSV File")
      return
    }

    var data: String
    do {
      data = try String(contentsOfFile: filePath)
    } catch {
      os_log(.error, "Can't change CSV File to String")
      return
    }

    var rows = data.components(separatedBy: "\r\n")
    for row in rows {
      let csvColumns = row.components(separatedBy: ",")
      if csvColumns.count >= 2 { // TODO: - 너무 임시방편 수정하기
        newlyWordDic.updateValue(csvColumns[1], forKey: csvColumns[0])
      }
    }
  }
}
