//
//  ViewController.swift
//  DynamicMemberLookupSampleApp
//
//  Created by 홍성준 on 1/31/24.
//

import UIKit
import MyLibrary

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.toFlexible()
            .do {
                $0.addSubview(
                    UIView(frame: .init(x: 100, y: 100, width: 50, height: 50))
                        .toFlexible()
                        .backgroundColor(.systemPink)
                        .toStiff()
                )
                $0.addSubview(
                    UIView(frame: .init(x: 100, y: 160, width: 30, height: 30))
                        .toFlexible()
                        .backgroundColor(.systemBrown.withAlphaComponent(0.3))
                        .toStiff()
                )
                $0.addSubview(
                    UIView(frame: .init(x: 100, y: 200, width: 70, height: 70))
                        .toFlexible()
                        .backgroundColor(.black)
                        .toStiff()
                )
                $0.addSubview(
                    UIView(frame: .init(x: 100, y: 300, width: 90, height: 80))
                        .toFlexible()
                        .backgroundColor(.yellow)
                        .toStiff()
                )
                $0.addSubview(
                    UIView(frame: .init(x: 100, y: 400, width: 150, height: 150))
                        .toFlexible()
                        .backgroundColor(.orange)
                        .toStiff()
                )
            }
    }
    
}
