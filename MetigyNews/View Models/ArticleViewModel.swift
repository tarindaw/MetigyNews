//
//  ArticleViewModel.swift
//  MetigyNews
//
//  Created by Tarinda on 9/7/21.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    
    var publishedDate: String {
        if let publishedDate = self.article.publishedAt {
            let dateFormatForDisplay = "dd-MM-yyyy"
            return formatIsoDateForDisplay(publishedDate, dateFormatForDisplay)
            }
        
        return ""
        }
    
    func formatIsoDateForDisplay(_ isoDate: String, _ displayFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: isoDate) {
            formatter.dateFormat = displayFormat
            return formatter.string(from: date)
        }
        return ""
    }
}








