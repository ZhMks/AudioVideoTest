//
//  Created by Netology on 18.06.2021.
//

import UIKit
import AVFoundation
import AVKit
import YouTubePlayer

class ViewController: UIViewController {

    var avController: AVPlayerViewController?

    let videoURLArray = ["https://www.youtube.com/watch?v=A6AzYntMhY4", "https://www.youtube.com/watch?v=uH205WQlC8A"]

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .red
        tableView.separatorInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YoutubeTableViewCell.self, forCellReuseIdentifier: "YoutubeCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }

    func setupUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         "Youtube Videos"
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        240
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoURLArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeCell") as? YoutubeTableViewCell else { return UITableViewCell() }
        let videoString = videoURLArray[indexPath.row]
        cell.updateCell(withVideo: videoString)
        return cell
    }
}
