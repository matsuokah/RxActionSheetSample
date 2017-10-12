//
//  UIViewController+RxActionSheet.swift
//  RxActionSheetSample
//
//  Created by 松岡 秀樹 on 2017/10/12.
//  Copyright © 2017年 matsuokah. All rights reserved.
//

import UIKit

import RxSwift

internal extension UIViewController {
	internal func showActionSheet<Type>(title: String?, message: String? = nil, cancelMessage: String = "Cancel", actions: [ActionSheetAction<Type>]) -> Observable<Type> {
		let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
		
		return actionSheet.addAction(actions: actions, cancelMessage: cancelMessage, cancelAction: nil)
			.do(onSubscribed: { [weak self] in
				self?.present(actionSheet, animated: true, completion: nil)
			})
	}
}
