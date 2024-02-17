//
//  TitleView.swift
//  FrameBaseLayoutSample
//
//  Created by 홍성준 on 2/17/24.
//

import UIKit
import PinLayout
import FlexLayout

final class TitleView: UIView {
  
  private var isColumn = true
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
  init() {
    super.init(frame: .zero)
    
    imageView.image = .checkmark
    titleLabel.text = "안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. 안녕하세요. "
    titleLabel.numberOfLines = 0
    
    flex.direction(.column).define {
      $0.addItem(imageView).height(100).aspectRatio(of: imageView)
      $0.addItem(titleLabel)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    pin.all()
    flex.layout(mode: .adjustHeight)
  }
  
  func animation() {
    isColumn.toggle()
    flex.direction(isColumn ? .column : .row)
    flex.markDirty()
    
    setNeedsLayout()
    UIView.animate(withDuration: 0.3) {
      self.layoutIfNeeded()
    }
  }
  
}

#Preview {
  TitleView()
}
