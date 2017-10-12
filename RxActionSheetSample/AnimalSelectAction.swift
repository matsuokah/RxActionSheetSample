//
//  AnimalSelectAction.swift
//  RxActionSheetSample
//
//  Created by 松岡 秀樹 on 2017/10/12.
//  Copyright © 2017年 matsuokah. All rights reserved.
//

import Foundation

enum AnimalSelectAction: String {
	case dog, cat, rabbit, panda
	
	static var AnimalSelectActions: [AnimalSelectAction] {
		return [.dog, .cat, .rabbit, .panda]
	}
}
