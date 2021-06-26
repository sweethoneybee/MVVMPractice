//
//  ViewController.swift
//  Observable-start
//
//  Created by kakao on 2021/06/26.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        example(of: "Single") {
            let disposeBag = DisposeBag()
            
            enum FileReadError: Error {
                case fileNotFound, unreadable, encodingFailed
            }
            
            func loadText(from name: String) -> Single<String> {
                return Single.create { single in
                    let disposable = Disposables.create()
                    
                    guard let path = Bundle.main.path(forResource: name, ofType: "txt") else {
                        single(.failure(FileReadError.fileNotFound))
                        return disposable
                    }
                    
                    guard let data = FileManager.default.contents(atPath: path) else {
                        single(.failure(FileReadError.unreadable))
                        return disposable
                    }
                    
                    guard let contents = String(data: data, encoding: .utf8) else {
                        single(.failure(FileReadError.encodingFailed))
                        return disposable
                    }
                    
                    single(.success(contents))
                    return disposable
                }
            }
            
            loadText(from: "Copyrights")
                .subscribe {
                    switch $0 {
                    case .success(let string): print(string)
                    case .failure(let error): print("un error!=\(error)")
                    }
                }
                .disposed(by: disposeBag)
        }
        
        
//        example(of: "just, of, from") {
//            // 1
//            let one = 1
//            let two = 2
//            let three = 3
//
//            // 2
//            let observable = Observable<Int>.just(one)
//            let observable2 = Observable.of(one, two, three)
//            let observable3 = Observable.of([one, two, three])
//            let observable4 = Observable.from([one, two, three])
//        }
//
//        example(of: "subscribe") {
//            let one = 1
//            let two = 2
//            let three = 3
//
//            let observable = Observable.of(one, two, three)
//
//            observable.subscribe(onNext: { element in
//                print(element)
//            })
//        }
//
//        example(of: "empty") {
//            let observable = Observable<Void>.empty()
//
//            observable.subscribe(onNext: { element in
//                print(element)
//            },
//            onCompleted: {
//                print("Completed")
//            })
//        }
//
//        example(of: "range") {
//            let observable = Observable<Int>.range(start: 1, count: 10)
//
//            observable.subscribe(onNext: { i in
//                let n = Double(i)
//
//                let fibonacci = Int(
//                    ((pow(1.61803, n) - pow(0.61803, n)) /
//                        2.23606).rounded()
//                )
//
//                print(fibonacci)
//            })
//        }
//
//        example(of: "deferred") {
//            let disposeBag = DisposeBag()
//
//            var flip = false
//
//            let factory: Observable<Int> = Observable.deferred {
//                flip.toggle()
//
//                if flip {
//                    return Observable<Int>.of(1, 2, 3)
//                } else {
//                    return Observable<Int>.of(4, 5, 6)
//                }
//            }
//
//            for _ in 0...3 {
//                factory.subscribe(onNext: {
//                    print($0, terminator: "")
//                })
//                .disposed(by: disposeBag)
//
//                print()
//            }
//        }
    }
    
    
}

extension ViewController {
    func example(of description: String, action: () -> Void) {
        print("\n--- Example of:", description, "---")
        action()
    }
}
