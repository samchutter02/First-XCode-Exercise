//
//  ViewController.swift
//  TableStory
//
//  Created by Sam Chutter on 3/17/25.
//

import UIKit

let data = [
    Item(name: "Sage", type: "Evergreen Perennial", desc: "Sage (Salvia officinalis) is a perennial herb native to the Mediterranean, prized for its strong, earthy flavor and slightly peppery aroma. Its soft, gray-green leaves are commonly used in culinary dishes like stuffing, sausages, and roasted meats, particularly in European cuisines. Beyond cooking, sage has a long history in traditional medicine, believed to aid digestion and improve memory, and its essential oils are used in aromatherapy.", lat: 30.273320, long: -97.753550, imageName: "sage"),
    Item(name: "Oregano", type: "Spreading Perennial", desc: "Oregano (Origanum vulgare) is a robust, aromatic herb from the mint family, widely celebrated for its bold, pungent flavor with hints of warmth and slight bitterness. Native to the Mediterranean, it’s a staple in Italian, Greek, and Mexican cuisines, enhancing dishes like pizza, pasta sauces, and grilled meats. Oregano is rich in antioxidants and has been used traditionally as an antiseptic and remedy for respiratory ailments.", lat: 30.313960, long: -97.719760, imageName: "oregano"),
    Item(name: "Rosemary", type: "Woody Shrub", desc: "Rosemary (Rosmarinus officinalis) is an evergreen, woody herb with needle-like leaves and a distinctive pine-like fragrance. Originating from the Mediterranean, it’s a versatile seasoning for roasted lamb, poultry, potatoes, and breads, imparting a robust, herbaceous flavor. Rosemary thrives in sunny, dry climates and has been valued since ancient times for its supposed cognitive benefits, often symbolizing remembrance, and its oils are used in perfumes and skincare.", lat: 30.2962244, long: -97.7079799, imageName: "rosemary"),
    Item(name: "Thai Basil", type: "Tender Annual", desc: "Thai Basil (Ocimum basilicum var. thyrsiflora) is a variety of basil distinguished by its vibrant, anise-like flavor and subtle spiciness, making it a cornerstone of Southeast Asian cuisine. With its sturdy stems, purple-tinged leaves, and floral aroma, it’s essential in dishes like Thai green curry, stir-fries, and pho. Unlike sweet basil, Thai basil retains its flavor when cooked, and it’s also valued for its antimicrobial properties in traditional herbal practices.", lat: 30.304890, long: -97.726220, imageName: "thaiBasil"),
    Item(name: "Thyme", type: "Low-Growing Perennial", desc: "Thyme (Thymus vulgaris) is a low-growing, woody herb with tiny, aromatic leaves, offering a subtle, earthy flavor with hints of lemon and mint. Native to the Mediterranean, it’s a key ingredient in French cuisine, seasoning stews, soups, and roasted vegetables, often as part of the bouquet garni. Thyme is drought-tolerant, thrives in rocky soils, and has been used historically as an antiseptic and to boost courage, with its oils featured in modern cosmetics.", lat: 30.280000, long: -97.740000, imageName: "thyme"),
    Item(name: "Cilantro", type: "Fast-Growing Annual", desc: "Cilantro (Coriandrum sativum), also known as coriander, is an annual herb with delicate, lacy leaves and a bright, citrusy flavor that polarizes tastes. Native to regions spanning southern Europe and western Asia, it’s a staple in Mexican, Indian, and Thai cuisines, flavoring salsas, curries, and garnishes. Its seeds (coriander) are also used as a spice, and cilantro is rich in antioxidants, traditionally used to aid digestion and detoxify the body.", lat: 30.310000, long: -97.710000, imageName: "cilantro"),
    Item(name: "Dill", type: "Feathery Annual", desc: "Dill (Anethum graveolens) is an annual herb with fine, feathery leaves and a distinctive, tangy flavor with hints of anise and lemon. Native to the Mediterranean and eastern Europe, it’s widely used in pickling, as well as seasoning fish, potatoes, and yogurt-based sauces like tzatziki. Dill seeds add a stronger flavor to dishes, and the herb has been employed historically as a digestive aid and to promote sleep.", lat: 30.320000, long: -97.700000, imageName: "dill"),
    Item(name: "Chives", type: "Clumping Perennial", desc: "Chives (Allium schoenoprasum) are a perennial herb with slender, hollow leaves and a mild onion-like flavor, part of the allium family alongside garlic and onions. Native to Europe, Asia, and North America, they’re a popular garnish for soups, salads, and baked potatoes, adding a fresh, subtle bite. Chives produce edible purple flowers and are valued for their ease of growth and mild diuretic properties in traditional remedies.", lat: 30.330000, long: -97.690000, imageName: "chives")
]

struct Item {
    var name: String
    var type: String
    var desc: String
    var lat: Double
    var long: Double
    var imageName: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var theTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data.count
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
      let item = data[indexPath.row]
      cell?.textLabel?.text = item.name
      let image = UIImage(named: item.imageName)
                    cell?.imageView?.image = image
                    cell?.imageView?.layer.cornerRadius = 2
                    cell?.imageView?.layer.borderWidth = 5
                    cell?.imageView?.layer.borderColor = UIColor.white.cgColor
      return cell!
  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let item = data[indexPath.row]
      performSegue(withIdentifier: "ShowDetailSegue", sender: item)
    
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "ShowDetailSegue" {
                  if let selectedItem = sender as? Item, let detailViewController = segue.destination as? DetailViewController {
                      // Pass the selected item to the detail view controller
                      detailViewController.item = selectedItem
                  }
              }
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        theTable.delegate = self
        theTable.dataSource = self
    }


}

