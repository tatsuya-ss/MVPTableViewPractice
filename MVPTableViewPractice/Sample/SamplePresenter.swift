//
//  SamplePresenter.swift
//  MVPTableViewPractice
//
//  Created by 坂本龍哉 on 2021/04/22.
//

import Foundation

protocol SamplePresenterInput {
    func didTapSearchButton(text: String?)
    var numberOfString: Int { get }
    func string() -> [String]
}

protocol SamplePresenterOutput: AnyObject {
    func update()
}

final class SamplePresenter : SamplePresenterInput {
    
    private(set) var view: SamplePresenterOutput!
    private var model: SampleModelInput
    
    private(set) var changeString: [String] = []
    
    var numberOfString: Int {
        return changeString.count
    }
    
    init(view: SamplePresenterOutput, model: SampleModelInput) {
        self.view = view
        self.model = model
    }
    
    func string() -> [String] {
        return changeString
    }

    
    func didTapSearchButton(text: String?) {
        guard let query = text else { return }
        guard !query.isEmpty else { return }

        model.change(query: query,
                     completion: { [ weak self] result in
                        switch result {
                        case let .success(change):
                            self?.changeString.append(change)
                            self?.view.update()
                        case let .failure(error):
                            print(error)
                        }
                     })
    }
    
    

}
