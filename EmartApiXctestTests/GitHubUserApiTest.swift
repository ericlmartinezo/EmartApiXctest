//
//  GitHubUserApiTest.swift
//  EmartApiXctestTests
//
//  Created by Eric Martinez on 1/31/20.
//  Copyright © 2020 emobile. All rights reserved.
//

import Foundation
import XCTest

class GitHubUserApiTest: XCTestCase {
    
    func testGitUserData() {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.github.com"
            components.path = "/users/ericlmartinezo"

            guard let gitUrl = components.url else { return }
            let promise = expectation(description: "Simple Request")
            URLSession.shared.dataTask(with: gitUrl) { (data, response
                , error) in
                guard let data = data else { return }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                    if let result = json as? NSDictionary {
                        XCTAssertTrue(result["name"] as! String == "Eric")
                        XCTAssertTrue(result["location"] as! String == "Portland, OR")
                        promise.fulfill()
                    }
                } catch let err {
                    print("Err", err)
                    }
                }.resume()
            waitForExpectations(timeout: 5, handler: nil)
        }
}
