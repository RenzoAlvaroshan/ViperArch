//
//  APIService.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation

protocol APIService {
	func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void)
}
