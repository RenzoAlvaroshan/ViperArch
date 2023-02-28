//
//  PostsView.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation

protocol PostsView: AnyObject {
	var presenter: PostsPresenter? { get set }
	func displayPosts()
	func displayError(_ message: String)
}
