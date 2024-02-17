//
//  HomeView.swift
//  FrameBaseLayoutSample
//
//  Created by 홍성준 on 2/17/24.
//

import UIKit
import PinLayout
import FlexLayout

final class HomeView: UIView {
  
  private let rootFlexContainer = UIView()
  private let titleView = TitleView()
  private let secondLabel = UILabel()
  private let button = UIButton()
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    
    secondLabel.text = "1239ㅁ널90먼0ㄹ9먼09ㄹ0몰90ㅗㅁㄴ09롬ㄹ2138123129ㅁ놀0"
    secondLabel.numberOfLines = 0
    
    button.configuration = .filled()
    button.setTitle("버튼", for: .normal)
    button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    
    rootFlexContainer.flex.direction(.column).padding(20).define { flex in
      flex.addItem(titleView)
      flex.addItem(secondLabel).paddingTop(10)
      flex.addItem(button)
    }
    
    addSubview(rootFlexContainer)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    rootFlexContainer.pin.all().margin(pin.safeArea)
    rootFlexContainer.flex.layout(mode: .adjustHeight)
  }
  
  @objc private func buttonDidTap() {
    titleView.animation()
  }
  
}

#Preview {
  HomeView()
}
