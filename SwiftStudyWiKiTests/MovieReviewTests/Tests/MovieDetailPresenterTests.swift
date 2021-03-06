//
//  MovieDetailPresenterTests.swift
//  SwiftStudyWiKiTests
//
//  Created by ChangMin on 2022/07/17.
//

import XCTest
@testable import SwiftStudyWiKi

class MovieDetailPresenterTest: XCTestCase {
    var sut: MovieDetailPresenter!
    
    var viewController: MockMovieDetailViewController!
    var movie: Movie!
    var userDefaultsManager: MockMovieUserDefualtsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockMovieDetailViewController()
        movie = Movie(title: "", imageURL: "", userRating: "", actor: "", director: "", pubDate: "")
        userDefaultsManager = MockMovieUserDefualtsManager()
        
        sut = MovieDetailPresenter(
            viewController: viewController,
            movie: movie,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        movie = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출될때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledsetViews)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
    
    func test_didTapRightBarButtonItem이_호출될때_isLiked가_true가되면() {
        movie.isLiked = false
        
        sut = MovieDetailPresenter(
            viewController: viewController,
            movie: movie,
            userDefaultsManager: userDefaultsManager
        )
        
        sut.didTapRightBarButtonItem()
        
        XCTAssertTrue(userDefaultsManager.isCalledAddMovie)
        XCTAssertFalse(userDefaultsManager.isCalledRemoveMovie)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
    
    func test_didTapRightBarButtonItem이_호출될때_isLiked가_false가되면() {
        movie.isLiked = true
        
        sut = MovieDetailPresenter(
            viewController: viewController,
            movie: movie,
            userDefaultsManager: userDefaultsManager
        )
        
        sut.didTapRightBarButtonItem()
        
        XCTAssertFalse(userDefaultsManager.isCalledAddMovie)
        XCTAssertTrue(userDefaultsManager.isCalledRemoveMovie)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
}


