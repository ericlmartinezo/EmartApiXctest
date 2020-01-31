//
//  PortlandCompaniesJsonTest.swift
//  EmartApiXctestTests
//
//  Created by Eric Martinez on 1/31/20.
//  Copyright © 2020 emobile. All rights reserved.
//

import Foundation
import XCTest
@testable import EmartApiXctest

class PortlandCompniesJsonTest: XCTestCase {
    
    var decoder = JSONDecoder()
    //    Option 1
        func testJsonData() {
            validateCompanyId()
        }
            
        func testDictionary() {
    //        Option 2

            let companyInfo = try! decoder.decode(PdxTech.self, from: companiesJson)
            if companyInfo.username != "Bret" {
            XCTFail("Username not equal to expected value")
            } else {
                print(companyInfo.username)
            }
            print(companyInfo.id)
    // access and validate nested Dictionary inside address
            let addressFamily = try! decoder.decode(Address.self, from: companiesJson)
            let companyProperties = addressFamily.address
            print(companyProperties.city)
            print(companyProperties.street,"St.")
            print(companyProperties.suite)
            print(companyProperties.zipcode)
        }
    //    Option 3
        func testCompanyArrayProperties() {
            let decoder = JSONDecoder()
            let companyInfo = try! decoder.decode(Company.self, from: companiesJson)
            let companyArrayValues = companyInfo.company
            print(companyArrayValues.bs)
    }
}
