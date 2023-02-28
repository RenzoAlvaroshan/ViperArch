//
//  APIServiceImpl.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Alamofire

final class APIServiceImpl: APIService {
	func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
		AF.request("https://jsonplaceholder.typicode.com/posts")
			.validate()
			.responseDecodable(of: [Post].self) { response in
				switch response.result {
				case .success(let posts):
					completion(.success(posts))
				case .failure(let error):
					completion(.failure(error))
				}
			}
	}
}
