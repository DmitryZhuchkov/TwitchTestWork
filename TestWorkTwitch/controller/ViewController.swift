//
//  ViewController.swift
//  TestWorkTwitch
//
//  Created by Дмитрий Жучков on 28.01.2021.
//

import UIKit
import Kingfisher
class ViewController: UIViewController{
    var resultData: JSONData?
    var ServiceTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceTableView = UITableView(frame: .zero, style: .grouped)
                guard let ServiceTableView = ServiceTableView else {
                    return
                }
        ServiceTableView.register(ServiceCell.self, forCellReuseIdentifier: "ServiceCell")
        ServiceTableView.dataSource = self
        let responseData = DataLoad()
        responseData.getData()
        responseData.completionHandler { [weak self] (resultData) in
               guard let self = self else {return}
                guard let _resultData = resultData else {return}
                self.resultData = _resultData
                self.ServiceTableView.reloadData()
        }
        ServiceTableView.delegate = self
        ServiceTableView.backgroundColor = .systemPurple
        ServiceTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ServiceTableView)
        ServiceTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        ServiceTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        ServiceTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        ServiceTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }

    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (resultData?.top.count) ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? ServiceCell
        if cell == nil {
                 cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ServiceCell") as? ServiceCell
             }
        let url = URL(string: (resultData?.top[indexPath.row].game.box.large) ?? "https://static-cdn.jtvnw.net/ttv-boxart/Just%20Chatting-272x380.jpg")
        let resourse = ImageResource(downloadURL: url!, cacheKey: (resultData?.top[indexPath.row].game.box.large))
        cell?.ServiceImage.kf.setImage(with: resourse)
        cell?.nameLabel.text = (resultData?.top[indexPath.row].game.name)
        cell?.channelsLabel.text = "Каналы - " + String(resultData?.top[indexPath.row].channels ?? 1)
        cell?.viewersLabel.text = "Зрители - " + String(resultData?.top[indexPath.row].viewers ?? 1)
              cell!.backgroundColor = #colorLiteral(red: 0.949755013, green: 0.949913919, blue: 0.9497340322, alpha: 1)
              return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
