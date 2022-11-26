//
//  ViewController.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 20.11.2022.
//

import UIKit
import SnapKit

public class SearchFactsViewController: UIViewController {
    
    var lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "test"
        lbl.font = UIFont(name: "Avenir Medium", size: 30)
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
            make.centerX.centerY.equalToSuperview()
        }
    }
}
