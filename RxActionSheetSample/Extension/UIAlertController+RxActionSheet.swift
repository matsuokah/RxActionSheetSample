//
//  UIAlertController+RxActionSheet.swift
//  RxActionSheetSample
//
//  Created by 松岡 秀樹 on 2017/10/12.
//  Copyright © 2017年 matsuokah. All rights reserved.
//

import UIKit

import RxSwift

// MARK: - Action
internal struct ActionSheetAction<Type: Equatable> {
	internal let title: String
	internal let actionType: Type
	internal let style: UIAlertActionStyle
}

// MARK: - UIAlertController
internal extension UIAlertController {

	internal func addAction<Type>(actions: [ActionSheetAction<Type>], cancelMessage: String, cancelAction: ((UIAlertAction) -> Void)? = nil) -> Observable<Type> {
		return Observable.create { [weak self] observer in
			actions.map { action in
				return UIAlertAction(title: action.title, style: action.style) { _ in
					observer.onNext(action.actionType)
					observer.onCompleted()
				}
				}.forEach { action in
					self?.addAction(action)
			}
			
			self?.addAction(UIAlertAction(title: cancelMessage, style: .cancel) {
				cancelAction?($0)
				observer.onCompleted()
			})
			
			return Disposables.create {
				self?.dismiss(animated: true, completion: nil)
			}
		}
	}
}
