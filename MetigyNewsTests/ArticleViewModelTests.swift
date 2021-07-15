//
//  ArticleViewModelTests.swift
//  MetigyNewsTests
//
//  Created by Tarinda on 13/7/21.
//

import XCTest
@testable import MetigyNews

class ArticleViewModelTests: XCTestCase {
    private var article: Article?
    private var articleViewModel: ArticleViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()

        self.article = Article(title: "Test Article", description: "Test Article Description", publishedAt: "2021-06-12T21:21:41Z")
        self.articleViewModel = ArticleViewModel(self.article!)
    }
    
    func testReturnedDateIsPreferredDisplayType() {
        // given
        let publishedIsoDate = self.article?.publishedAt
        let displayDateFormat = "dd-MM-yyyy"
        
        // when
        let result = self.articleViewModel?.formatIsoDateForDisplay(publishedIsoDate!, displayDateFormat)
        
        // then
        XCTAssertEqual(result, "13-06-2021")
    }

    override func tearDownWithError() throws {
        self.article = nil
        self.articleViewModel = nil
        
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
