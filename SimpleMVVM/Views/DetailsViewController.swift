import UIKit

class DetailsViewController: UIViewController {
    
    let detailViewModel: DetailViewModel
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    
    private let labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        displayUserInfo()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Details"
        let array = [nameLabel, usernameLabel, phoneLabel, emailLabel, streetLabel, suiteLabel, cityLabel]
        for item in array { labelsStackView.addArrangedSubview(item) }
        view.addSubview(labelsStackView)
    }
    
    private func displayUserInfo() {
        self.nameLabel.text = detailViewModel.name
        self.usernameLabel.text = detailViewModel.username
        self.emailLabel.text = detailViewModel.email
        self.phoneLabel.text = detailViewModel.phone
        
        self.streetLabel.text = detailViewModel.street
        self.suiteLabel.text = detailViewModel.suite
        self.cityLabel.text = detailViewModel.city
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }

}
