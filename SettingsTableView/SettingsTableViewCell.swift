import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    private let iconContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    let additionalLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .right
        label.text = ""
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(additionalLabel)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.2
        iconImageView.frame = CGRect(x: (size-imageSize)/2,
                                     y: (size-imageSize)/2,
                                     width: imageSize,
                                     height: imageSize)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 25 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        
        additionalLabel.frame = CGRect(x: (contentView.frame.size.width - contentView.frame.size.width/1.9),
                             y: (contentView.frame.size.height / 10),
                             width: contentView.frame.size.width/2,
                             height: iconContainer.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        additionalLabel.text = ""
    }
    
    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        
        switch label.text {
        case "Wi-Fi":
            additionalLabel.text = "???? ????????????????????"
        case "Bluetooth":
            additionalLabel.text = "??????."
        default:
            break
        }
    }
}
