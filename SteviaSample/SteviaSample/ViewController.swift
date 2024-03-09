//
//  ViewController.swift
//  SteviaSample
//
//  Created by 홍성준 on 3/9/24.
//

import UIKit
import Stevia

final class ViewController: UIViewController {
  
  private let titleLabel = UILabel()
  private let profileImageView = UIImageView()
  private let userNameLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let actionButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupStyling()
  }
  
  private func setupLayout() {
    view.subviews {
      titleLabel
      profileImageView
      userNameLabel
      descriptionLabel
      actionButton
    }
            
    view.layout {
      50
      |-20-titleLabel-20-|
      20
      |-20-profileImageView.size(30)-10-userNameLabel-20-|
      30
      |-20-descriptionLabel-20-|
      >=0
      |-20-actionButton-20-| ~ 50
      30
    }
  }
  
  private func setupStyling() {
    titleLabel.style {
      $0.text = "타이틀 입니다"
      $0.font = .systemFont(ofSize: 21, weight: .bold)
    }
    
    profileImageView.style {
      $0.image = UIImage(systemName: "person.fill")
      $0.contentMode = .scaleAspectFit
    }
    
    userNameLabel.style {
      $0.text = "hogumachu"
      $0.font = .systemFont(ofSize: 13)
    }
    
    descriptionLabel.style {
      $0.text = "asfjaospfjopasjfopasjfopajsfjaspfjapsfjaospfjopsajfpsoafjaspjfpoasjfpoasjfaspfjopasfjosapfjapsofjpoasjfopasfjpoasjfopajfoajsfpjaspfojasopfjasopfjaspofjapsofjaopsfjpsafjopasjfopasjfpsajfpoasjfop"
      $0.numberOfLines = 0
      $0.font = .systemFont(ofSize: 11)
    }
    
    actionButton.style {
      $0.configuration = .filled()
      $0.setTitle("완료", for: .normal)
    }
  }
  
}

