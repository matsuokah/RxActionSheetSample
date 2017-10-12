//
//  ViewController.swift
//  RxActionSheetSample
//
//  Created by 松岡 秀樹 on 2017/10/12.
//  Copyright © 2017年 matsuokah. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class ViewController: UIViewController {

	private let disposeBag = DisposeBag()
	
	@IBOutlet weak var showActionSheetButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		showActionSheetButton.rx
			.tap
			.asDriver()
			.drive(onNext: { [weak self] _ in
				self?.showActionSheet()
			}).disposed(by: disposeBag)
	}
}

private extension ViewController {
	func showActionSheet() {
		let actions = AnimalSelectAction.AnimalSelectActions
			.map {
				return ActionSheetAction(title: $0.rawValue, actionType: $0, style: .default)
		}
		
		showActionSheet(title: "Which Do you like?", actions: actions)
			.subscribe { (event: Event<AnimalSelectAction>) in
				NSLog(event.debugDescription)
			}.disposed(by: disposeBag)
	}
}

