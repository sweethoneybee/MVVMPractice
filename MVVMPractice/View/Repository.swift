//
//  Repository.swift
//  MVVMPractice
//
//  Created by kakao on 2021/06/25.
//

import Foundation

class Repository {
    func fetchNow(onCompleted: @escaping ((UtcTimeModel) -> Void)) {
        let url = "http://worldclockapi.com/api/json/utc/now"
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
            onCompleted(model)
        }.resume()
    }
}
