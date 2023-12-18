//
//  YoutubeTableViewCell.swift
//  BasicVideoPlayer
//
//  Created by Максим Жуин on 11.12.2023.
//

import UIKit
import YouTubePlayer
import WebKit


class YoutubeTableViewCell: UITableViewCell {

    let identifier = "YoutubeCell"

    var player: YoutubePlayerMainView?

    var webView: WKWebView?


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "YoutubeCell")
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 350, height: 240))
        webView?.scrollView.isScrollEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateCell(withVideo: String?) {

        // Используя поды

//        let player = YoutubePlayerMainView(frame: CGRect(x: 0, y: 0, width: 350, height: 240))
//        contentView.addSubview(player)
//        guard let url = withVideo else { return }
//        if let streamURL = URL.init(string: url) {
//            player.youtubePlayer.loadVideoURL(streamURL)
//        }

        // Через вебвью
        
        contentView.addSubview(webView!)
        guard let url = withVideo else { return }
                if let streamURL = URL.init(string: url) {
                    webView?.load(URLRequest(url: streamURL))
                }

    }
}



