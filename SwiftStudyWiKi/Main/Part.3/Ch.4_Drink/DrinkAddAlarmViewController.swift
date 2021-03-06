//
//  DrinkAddAlarmViewController.swift
//  SwiftStudyWiKi
//
//  Created by ChangMin on 2022/05/08.
//

import UIKit
import SnapKit
import Then

class DrinkAddAlarmViewController: UIViewController {
    
    var pickedDate: ((_ date: Date) -> Void)?
    
    lazy var cancelBtn = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.addTarget(self, action: #selector(tapCancelBtn), for: .touchUpInside)
    }
    
    lazy var saveBtn = UIButton().then {
        $0.setTitle("저장", for: .normal)
        $0.addTarget(self, action: #selector(tapSaveBtn), for: .touchUpInside)
    }
    
    let timeLbl = UILabel().then {
        $0.text = "시간"
    }
    
    let timePicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .inline
        $0.locale = Locale(identifier: "ko ")
        $0.minuteInterval = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.title = "알람 추가"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveBtn)
        
        setupView()
    }
    
    @objc private func tapCancelBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc private func tapSaveBtn(_ sender: UIButton) {
        pickedDate?(timePicker.date)
        self.dismiss(animated: true)
    }
    
    private func setupView() {
        [timeLbl, timePicker]
            .forEach {
                view.addSubview($0)
            }
        
        
        setupConstraint()
    }
    
    private func setupConstraint() {
        timeLbl.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(80)
            $0.leading.equalToSuperview().inset(20)
        }
        
        timePicker.snp.makeConstraints {
            $0.centerY.equalTo(timeLbl.snp.centerY)
            $0.width.equalTo(193)
            $0.height.equalTo(50)
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
