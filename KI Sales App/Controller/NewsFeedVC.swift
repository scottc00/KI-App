//
//  NewsFeedVC.swift
//  KI Sales App
//
//  Created by Scott Callery on 09/02/2018.
//  Copyright © 2018 Scott Callery. All rights reserved.
//

import UIKit
import Firebase

class NewsFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    //Outlets
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        
        // Listeners
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.dismiss(animated: true, completion: nil)
                print("SCOTT: NO USER")
            } else {
                print("SCOTT: USER IS LOGGED IN")
            }
        }
        
        DataService.ds.REF_POSTS.observe(.value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let id = snap.key
                        let post = Post(postId: id, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        }
    }
    
    @IBAction func newPostButtonPressed(_ sender: Any) {
        let newPostXIB = NewPostXIB()
        newPostXIB.modalPresentationStyle = .custom
        present(newPostXIB, animated: false, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as? NewsFeedCell {
            cell.configureCell(post: post)
            return cell
        } else {
            return NewsFeedCell()
        }
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
        self.tableView.contentOffset = CGPoint(x: 0, y: CGFloat(searchController.searchBar.frame.height))
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

