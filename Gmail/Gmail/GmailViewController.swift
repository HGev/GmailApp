//
//  GmailViewController.swift
//  Gmail
//
//  Created by appler on 29.06.23.
//

import UIKit
struct Mail{
    var fromWho:String
    var theme:String
    var text:String
}
struct HamburgerItem {
    let name: String
    let image: UIImage
}
class GmailViewController: UIViewController, UISearchResultsUpdating {
    var mails:[Mail] = [Mail(fromWho: "Armenian Code Academy", theme: "ACA Monthly Digest", text: "Ուրախ ենք տեղեկացնել, որ հուլիսի 2-ին ACA-ում կանցկացվի Բաց Դռների Օր։Եթե ցանկանում եք ծանոթանալ ՏՏ ոլորտի պահանջված մասնագիտություններին և հասկանալ թե ինչ է պետք սովորել՝ ձեր կարիերան սկսելու և աշխատաշուկայում մրցունակ մասնագետ դառնալու համար, ապա կարող եք անցնել հղումով և գրանցվել Բաց Դռների Օրվան։Ստորև կարող եք ծանոթանալ հուլիսին մեկնարկող դասընթացներին և այլ ծրագրերին, իսկ ձեր հարցերը կարող եք ուղղել բաց դռների օրվա ընթացքում։"),Mail(fromWho: "hh.ru", theme: "Подходяшие вакансии", text: "Новые вакансии для резюме: Стажер-разработчик iOS в Яндекс Маркет Мы нашли несколько вакансий, которые могут вам подойти."),Mail(fromWho: "Team Snapchat", theme: "See who just added you as a friend", text: "hasfgdvffhd added you as a friend")
    ]

    var hamburgerItems: [HamburgerItem] = [HamburgerItem(name: "All inboxes", image: UIImage(systemName:"cube.box")!),
                                  HamburgerItem(name: "Primary", image: UIImage(systemName: "cube.box")!),
                                  HamburgerItem(name: "Social", image: UIImage(systemName: "cube.box")!),
                                  HamburgerItem(name: "Promotions", image: UIImage(systemName: "cube.box")!)]


    
    let mainTableView = UITableView()
    let hamburgerTableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarSetUp()
        mainTableViewSetUp()
        hamburgerTableViewSetUp()
    }
    private func hamburgerTableViewSetUp(){
        let hamburgerTableView = UITableView(frame: view.bounds, style: .plain)
        hamburgerTableView.backgroundColor = .blue
        view.addSubview(hamburgerTableView)
        hamburgerTableView.delegate = self
        hamburgerTableView.dataSource = self
        hamburgerTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hamburgerTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            hamburgerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -200),
            hamburgerTableView.widthAnchor.constraint(equalToConstant: 160),
            hamburgerTableView.heightAnchor.constraint(equalToConstant: 728)
        ])
    }
    private func mainTableViewSetUp(){
        
        view.addSubview(mainTableView)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
                mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    private func searchBarSetUp(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchController.searchBar)
        NSLayoutConstraint.activate([
            searchController.searchBar.topAnchor.constraint(equalTo: view.topAnchor),
            searchController.searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -150),
            searchController.searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchController.searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    
}

extension GmailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainTableView {
                  return mails.count
              } else if tableView == hamburgerTableView {
                  return hamburgerItems.count
              }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if tableView == mainTableView {
             cellIdentifier = "Cell"
             cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            }
            let mail = mails[indexPath.row]
            
            // First Line
            let fromWhoLabel = UILabel()
            fromWhoLabel.text = mail.fromWho
            fromWhoLabel.font = UIFont.boldSystemFont(ofSize: 18)
            cell?.contentView.addSubview(fromWhoLabel)
            fromWhoLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                fromWhoLabel.leadingAnchor.constraint(equalTo: cell!.contentView.leadingAnchor, constant: 16),
                fromWhoLabel.topAnchor.constraint(equalTo: cell!.contentView.topAnchor, constant: 8),
            ])
            
            // Second Line
            let themeLabel = UILabel()
            themeLabel.text = mail.theme
            themeLabel.font = UIFont.systemFont(ofSize: 16)
            cell?.contentView.addSubview(themeLabel)
            themeLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                themeLabel.leadingAnchor.constraint(equalTo: cell!.contentView.leadingAnchor, constant: 16),
                themeLabel.topAnchor.constraint(equalTo: fromWhoLabel.bottomAnchor, constant: 8),
            ])
            
            // Third Line
            let textLabel = UILabel()
            textLabel.text = mail.text
            textLabel.font = UIFont.systemFont(ofSize: 14)
            textLabel.numberOfLines = 1
            textLabel.lineBreakMode = .byTruncatingTail
            cell?.contentView.addSubview(textLabel)
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textLabel.leadingAnchor.constraint(equalTo: cell!.contentView.leadingAnchor, constant: 16),
                textLabel.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 8),
                textLabel.trailingAnchor.constraint(equalTo: cell!.contentView.trailingAnchor, constant: -16),
                textLabel.bottomAnchor.constraint(equalTo: cell!.contentView.bottomAnchor, constant: -8),
            ])
        }else if tableView == hamburgerTableView {
            cellIdentifier = "hamburgerCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            let textLabel = UILabel()
            let imageView = UIImageView(image: hamburgerItems[indexPath.row].image)
            textLabel.text = hamburgerItems[indexPath.row].name
            textLabel.font = UIFont.boldSystemFont(ofSize: 18)
            cell?.contentView.addSubview(textLabel)
             cell?.contentView.addSubview(imageView)
             imageView.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                 imageView.leadingAnchor.constraint(equalTo: cell!.contentView.leadingAnchor, constant: 16),
                 imageView.centerYAnchor.constraint(equalTo: cell!.contentView.centerYAnchor),
                 imageView.widthAnchor.constraint(equalToConstant: 24),
                 imageView.heightAnchor.constraint(equalToConstant: 24)
             ])
        }
        return cell!
    }
    @IBAction func hamburgerBar(_ sender: Any){
        NSLayoutConstraint.activate([hamburgerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 400)])
    }
    
}
