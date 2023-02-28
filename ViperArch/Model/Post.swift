//
//  Post.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation

struct Post: Codable {
	let userId: Int
	let id: Int
	let title: String
	let body: String
}
