import UIKit
import UIExtensions
import SnapKit

class TitleCell: AppCell {
    private let iconSize: CGFloat = 24

    var iconImageView = TintImageView()
    var titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { maker in
            maker.leading.equalTo(contentView.snp.leadingMargin)
            maker.size.equalTo(iconSize)
            maker.centerY.equalToSuperview()
        }

        iconImageView.tintColor = .cryptoYellow

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(iconImageView.snp.trailing).offset(CGFloat.margin4x)
            maker.centerY.equalToSuperview()
        }

        titleLabel.font = .appBody
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(titleIcon: UIImage? = nil, title: String, titleColor: UIColor = .crypto_White_Black, showDisclosure: Bool = false, last: Bool = false) {
        super.bind(showDisclosure: showDisclosure, last: last)

        iconImageView.snp.updateConstraints { maker in
            let sideSize = titleIcon != nil ? iconSize : 0
            maker.size.equalTo(sideSize)
        }
        titleLabel.snp.updateConstraints { maker in
            let margin = titleIcon != nil ? CGFloat.margin4x : 0
            maker.leading.equalTo(self.iconImageView.snp.trailing).offset(margin)
        }

        iconImageView.image = titleIcon

        titleLabel.text = title
        titleLabel.textColor = titleColor
    }

}
