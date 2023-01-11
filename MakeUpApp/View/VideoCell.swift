//
//  VideoCell.swift
//  tableViewProgramatically
//
//  Created by sweta makuwala on 12/10/22.
//

import UIKit

class VideoCell: UITableViewCell {
    
    let videoImageView = UIImageView()
    let videoTitleLbl = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoImageView)
        addSubview(videoTitleLbl)
        configureImageView()
        configureTitleLbl()
        setImageConstraints()
        setTitleLblConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented ")
    }
    
    func set(meme: Meme){
        videoTitleLbl.text = meme.name
        ImageDownloadManager.shared.loadImgFromUrl(urlString: meme.url) { data in
            if let safeData = data {
                DispatchQueue.main.async {
                    self.videoImageView.image = UIImage(data: safeData)
                }
            }
        }
        
    }
   
    func configureImageView(){
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    
    func configureTitleLbl(){
        videoTitleLbl.numberOfLines = 0
        videoTitleLbl.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
        
    }
    func setTitleLblConstraints() {
        videoTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoTitleLbl.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 20).isActive = true
        videoTitleLbl.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
