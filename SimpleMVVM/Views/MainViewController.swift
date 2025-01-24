import UIKit

class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .orange
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }


}

