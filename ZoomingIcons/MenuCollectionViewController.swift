//
//  MenuCollectionViewController.swift
//  ZoomingIcons
//
//  Created by Auston Salvana on 8/6/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class MenuCollectionViewController: UICollectionViewController {
    
    var masterArray: [AnyObject]!
    var sectionOne: [SocialItem]!
    var sectionTwo: [SocialItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//        flow.minimumLineSpacing = 20
//        flow.minimumInteritemSpacing = 30
        
        
        
        var SocialItem1 = SocialItem(image: UIImage(named:"icon-twitter")!, color: UIColor(red: 0.255, green: 0.557, blue: 0.910, alpha: 1), name:"Twitter", summary: "Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\".")
        
        var SocialItem2 = SocialItem(image: UIImage(named: "icon-facebook")!, color: UIColor(red: 0.239, green: 0.353, blue: 0.588, alpha: 1), name: "Facebook", summary: "Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities.")
        
      
        var SocialItem3 = SocialItem(image: UIImage(named: "icon-youtube")!, color: UIColor(red: 0.729, green: 0.188, blue: 0.180, alpha: 1), name: "Youtube", summary: "YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos.")
        
        var SocialItem4 = SocialItem(image: UIImage(named:"icon-vimeo")!, color: UIColor(red: 0.329, green: 0.737, blue: 0.988, alpha: 1), name: "Vimeo", summary: "Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein.")

        var SocialItem5 = SocialItem(image: UIImage(named:"icon-instagram")!, color: UIColor(red: 0.325, green: 0.498, blue: 0.635, alpha: 1), name: "Instagram", summary: "Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr.")
        
        sectionOne = [ SocialItem1, SocialItem2]
        sectionTwo = [SocialItem3, SocialItem4, SocialItem5]
        masterArray = [sectionOne, sectionTwo]
        
    }
    
    //MARK - segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailViewController" {
            var DetailVC: DetailViewController = segue.destinationViewController as! DetailViewController
            let indexPath = sender as! NSIndexPath
            DetailVC.item = masterArray[indexPath.section][indexPath.row] as? SocialItem
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return masterArray[section].count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomCollectionViewCell
        
        
        // Configure the cell
        let item = masterArray[indexPath.section][indexPath.row] as! SocialItem
        cell.imageView.image = item.image
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            var cellWidth : CGFloat = 80;
            
            var numberOfCells = CGFloat(collectionView.numberOfItemsInSection(section))
            
            var edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
            
            return UIEdgeInsetsMake(100, edgeInsets, 60.0, edgeInsets);
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("DetailViewController", sender: indexPath)
    
    }
    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
