//
//  NewsListTableViewController.swift
//  MetigyNews
//
//  Created by Tarinda on 9/7/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel!
    private var weatherViewModel: WeatherViewModel!
    private var tableHeaderViewHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: View set up methods
    
    private func setup() {
        
        let newsResourceUrl = Resource<ArticlesList>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=au&sortBy=publishedAt&apiKey=e83d171129264a2da66599206803937d")!)
        
        let weatherResourceUrl = Resource<WeatherModel>(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Sydney&appid=21195bebe28ce733d4561dfd215ce5e7&units=Metric")!)
        
        let dispatchGroup = DispatchGroup()
        
        // Fetching News data
        dispatchGroup.enter()
        URLRequest.load(resource: newsResourceUrl) { returnedArticleList in
            guard let articleList = returnedArticleList as? ArticlesList else {
                fatalError("Error in returned Article List ")
            }
            self.articleListViewModel = ArticleListViewModel(articles: articleList.articles)            
            dispatchGroup.leave()
        }
        
        // Fetching Weather data
        dispatchGroup.enter()
        URLRequest.load(resource: weatherResourceUrl) { returnedWeatherData in

            guard let returnedWeatherData = returnedWeatherData as? WeatherModel else {
                fatalError("Error in returned Article List ")
            }
            self.weatherViewModel = WeatherViewModel(returnedWeatherData)
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    // MARK: Table View related methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Article Table View Cell")
        }
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        cell.publishedDate.text = articleViewModel.publishedDate
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {       
        let headerView = Bundle.main.loadNibNamed("ArticleTableHeaderView", owner: self, options: nil)?.first as! ArticleTableHeaderView
        
        headerView.cityLabel.text = self.weatherViewModel.cityName
        headerView.temperatureLabel.text = self.weatherViewModel.temperature
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableHeaderViewHeight
    }
}



