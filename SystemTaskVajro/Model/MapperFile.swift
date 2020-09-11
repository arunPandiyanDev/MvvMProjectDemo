//
//  MapperFile.swift
//  SystemTaskVajro
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import ObjectMapper

struct AppleMusicAndApp: Mappable, Codable {
    
    var articlesFeed: [ArticlesObject]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        articlesFeed <- map["articles"]
    }
}

struct ArticlesObject: Mappable, Codable {
    
    var id: String?
    var title: String?
    var bodyText: String?
    var imageData: ImageData?
    var summaryText: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        bodyText <- map["body_html"]
        imageData <- map["image"]
        summaryText <- map["summary_html"]
    }
}

struct ImageData: Mappable, Codable {
    var src: String?
    var width: Int?
    var height: Int?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        src <- map["src"]
        width <- map["width"]
        height <- map["height"]
    }
    
    
}
