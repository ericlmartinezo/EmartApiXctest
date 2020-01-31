//
//  PortlandWeatherTest.swift
//  EmartApiXctestTests
//
//  Created by Eric Martinez on 1/31/20.
//  Copyright © 2020 emobile. All rights reserved.
//

import Foundation
import XCTest
@testable import EmartApiXctest

class portlandWeatherTest : XCTestCase {
    
    func testNoaaData() {
            
            guard let noaaUrlPortland = URL(string: NoaaPortlandUrl.urlPortlandUrl.rawValue) else { return }
            
            let promise = expectation(description: "Tesing NOAA local Weather API for Portland, OR") // Use fulfill at the end of request
            print(promise)
            
            URLSession.shared.dataTask(with: noaaUrlPortland) { (data, response, error) in
                guard let data = data else { return }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) // mutableContainers why?

                    if let result = json as? NSDictionary {
                        XCTAssertTrue(result["operationalMode"] as! String == "Production")
                        XCTAssertTrue(result["srsName"] as! String == "WGS 1984")
                        XCTAssertTrue(result["productionCenter"] as! String == "Portland, OR")
                        XCTAssertTrue(result["moreInformation"] as! String == "http://weather.gov")
            promise.fulfill()
//                        Nested dictionary
                        let weather_pdx = result.value(forKeyPath: "location") as Any
                        
                        let weather_pdx_region = (weather_pdx as AnyObject).value(forKeyPath: PortlandLocationKey.portlandRegion.rawValue)
//                        Validate weather_pdx_region without using the enum:
//                        let weather_pdx_region_0 = (weather_pdx as AnyObject).value(forKeyPath: "region")
//                        XCTAssertTrue((weather_pdx_region_0 != nil))
                        let weather_pdx_wfo = (weather_pdx as AnyObject).value(forKeyPath: PortlandLocationKey.portlandWFO.rawValue)
                        let weather_pdx_zone = (weather_pdx as AnyObject).value(forKeyPath: PortlandLocationKey.portlandZone.rawValue)
                        let weather_pdx_areaDescription = (weather_pdx as AnyObject).value(forKeyPath: PortlandLocationKey.portlandAreaDescription.rawValue)
                        
                        XCTAssertTrue(weather_pdx_region as! String == PortlandLocationValue.regionValue.rawValue)
                        XCTAssertTrue(weather_pdx_wfo as! String == PortlandLocationValue.wfoValue.rawValue)
                        XCTAssertTrue(weather_pdx_zone as! String == PortlandLocationValue.zoneValue.rawValue)
                        XCTAssertTrue(weather_pdx_areaDescription as! String == PortlandLocationValue.areaDescription.rawValue)
    //                    print(weather_pdx_areaDescription!)
                        }
                    } catch let err {
                        print("Err", err)
                }
            }.resume()
            waitForExpectations(timeout: 7, handler: nil)
        }
}
