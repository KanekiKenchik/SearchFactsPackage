//
//  ViewController.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 20.11.2022.
//

import UIKit
import SnapKit


public class SearchFactsViewController: UIViewController {
    
    let lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "test"
        return lbl
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        
        view.backgroundColor = .red
        view.addSubview(lbl)
        
        lbl.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
}
