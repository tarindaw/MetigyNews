//
//  NewsArticle.swift
//  MetigyNews
//
//  Created by Tarinda on 9/7/21.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
    let publishedAt: String?    
}
