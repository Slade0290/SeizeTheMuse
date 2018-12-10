//
//  SearchController.swift
//  SeizeTheMuse
//
//  Created by Clement on 08/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

    var songs = [SongBis]()
    var myIndex = 0

class SearchController: UIViewController {

    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var TableSound: UITableView!
    
    var searchSongs = [SongBis]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSound()

    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    func fetchSound(){
        
        let ref = Database.database().reference()
            
        ref.child("Sounds").observe(.childAdded) { (snapshot) in
                
                if let dictionary = snapshot.value as?  [String: AnyObject]{
                print(snapshot)
                print("dictionary")
                print(dictionary)
                let song = SongBis()
                song.author = dictionary["author"] as? String
                song.title = dictionary["title"] as? String
                song.son = dictionary["son"] as? String
                song.date = dictionary["date"] as? String
                song.difficulty = dictionary["difficulty"] as? String
                songs.append(song)
                self.TableSound.reloadData()
            }
        }
    }
}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchSongs.count
        } else {
            return songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            let song = searchSongs[indexPath.row]
            cell?.textLabel?.text = song.title
        } else {
            let song = songs[indexPath.row]
            cell?.textLabel?.text = song.title
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "GoToProfilSong", sender: self)
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            searchSongs = songs
            TableSound.reloadData()
            return
        }
        searchSongs = songs.filter({ (song) -> Bool in
            song.title!.lowercased().contains(searchText.lowercased())
        })
        TableSound.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        TableSound.reloadData()
    }
    
}
