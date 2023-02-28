//
//  PostsRouter.swift
//  ViperArch
//
//  Created by Renzo Alvaroshan on 25/02/23.
//

import Foundation
import UIKit

typealias EntryPoint = PostsView & UIViewController

protocol PostsRouter {
	var entry: EntryPoint? { get }
	var presenter: PostsPresenter? { get set }
}
