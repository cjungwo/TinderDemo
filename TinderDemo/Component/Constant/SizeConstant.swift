//
//  SizeConstant.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct SizeConstant {
  static var screenCutoff: CGFloat {
    (UIScreen.main.bounds.width / 2) * 0.8
  }
  
  static var cardWidth: CGFloat {
    UIScreen.main.bounds.width - 20
  }
  
  static var cardHeight: CGFloat {
    UIScreen.main.bounds.height / 1.55
  }
}
