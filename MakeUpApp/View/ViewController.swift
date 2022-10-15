//
//  ViewController.swift
//  MakeUpApp
//
//  Created by sweta makuwala on 10/10/22.
//

import UIKit


class ViewController: UIViewController {
    
    var tableView = UITableView()
    let memeresource = ViewModel()
    var memeOutput : [Meme]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Meme"
        
        showIndicator()
        
      //  DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            self.memeresource.getproducts { [weak self]  result in
                DispatchQueue.main.async {
                    self?.hideIndicator()
                    self?.memeOutput =  result?.data.memes
                    self?.tableView.reloadData()
                }
            } errorCompletion: { error in
                DispatchQueue.main.async {
                    self.showAlert(vc: self, title: error ?? "")
                }
            }
        //}

    }
    
    func showIndicator() {
        ActivityIndicatorClass.shared.presentActivityIndicator(vc: self)
    }
    
    func hideIndicator(){
        ActivityIndicatorClass.shared.removeActivityIndicator(vc:self)
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        //set delegates
        // set row heights
        //register cells
        //set constraints
        
        tableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Constants.videoCell)
        tableView.pin(to:view)
    }
    
    func tableViewDelegate(){
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
}
extension ViewController {
     func showAlert(vc: UIViewController, title: String){
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.OkAlertTitle, style: .cancel) { action in
            vc.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}

// MARK: - data source and delegate
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return memeOutput?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCell) as! VideoCell
        cell.set(meme: (memeOutput?[indexPath.row])!)
        return cell
    }
    
    
}
