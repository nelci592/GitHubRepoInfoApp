//
//  RepoInfoAppTests.swift
//  RepoInfoAppTests
//
//  Created by Neli Todorova on 9.07.22.
//

import XCTest
@testable import RepoInfo

class RepoInfoAppTests: XCTestCase {

    func test_setImageDart_returnsDart(){
        let sut = RepositoryViewModel()
        let actual = sut.setImage(repositoryLanguage: "Dart")
        let expected = "dart"
        XCTAssertEqual(actual, expected)
    }
    
    func test_formatDate_returnsFormattedDate(){
        let sut = RepositoryViewModel()
        let actual = sut.formatStringDate(date: "2019-06-21T12:04:51Z")
        let expected = "01/01/1970"
        XCTAssertEqual(actual, expected)
    }
    
}
