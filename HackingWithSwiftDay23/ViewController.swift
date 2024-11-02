//
//  ViewController.swift
//  HackingWithSwiftDay23
//
//  Created by Muhammed Yılmaz on 2.11.2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()
    var cleanedFlags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FLAGS"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("flag") {
                flags.append(item)
            }
        }
        
        for flag in flags {
            var newFlag = flag
            
            if newFlag.hasPrefix("flag.") {
                newFlag.removeFirst("flag.".count)
            }
            
            if newFlag.hasSuffix(".png") {
                newFlag.removeLast(".png".count)
            }
            
            cleanedFlags.append(newFlag.uppercased())
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cleanedFlags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Flg")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flg", for: indexPath)
        cell.textLabel?.text = cleanedFlags[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Flag") as? FlagViewController {
            vc.selectFlag = flags[indexPath.row]
            vc.nameFlag = cleanedFlags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

