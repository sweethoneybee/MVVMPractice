//
//  ViewModel.swift
//  MVVMPractice
//
//  Created by kakao on 2021/06/25.
//

import Foundation

class ViewModel {
    var onUpdated: () -> Void = {}
    var dateTimeString: String = "Loading..." { // 화면에 보여져야할 값 // View를 위한 Model: ViewModel
        didSet {
            onUpdated()
        }
    }
    
    let service = Service()

    private func dateToString(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
    
    func reload() {
        service.fetchNow { [weak self] model in
            guard let self = self else { return }
            let dateString = self.dateToString(date: model.currentDateTime)
            self.dateTimeString = dateString
        }
    }
    
    func moveDay(day: Int) {
        service.moveDay(day: day)
        dateTimeString = dateToString(date: service.currentModel.currentDateTime)
    }
}
