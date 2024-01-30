//
//  ViewController.swift
//  ModuleLinkSampleApp
//
//  Created by 홍성준 on 1/30/24.
//

import UIKit
import StaticLibraryA
import FrameworkB
import PackageC
import FrameworkZZ

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StaticLibraryA.log()
        FrameworkB.log()
        PackageC.log()
        FrameworkZZ.log()
    }
    
}

