import UIKit
import SnapKit

class FullTransactionInfoTextCell: TitleCell {
    private let descriptionView = HashView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.font = .appSubhead2
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        iconImageView.tintColor = .appGray

        contentView.addSubview(descriptionView)
        descriptionView.snp.makeConstraints { maker in
            maker.leading.equalTo(titleLabel.snp.trailing).offset(CGFloat.margin12x)
            maker.centerY.equalToSuperview()
            maker.trailing.equalTo(disclosureImageView.snp.leading).inset(CGFloat.margin4x)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(item: FullTransactionItem, selectionStyle: SelectionStyle = .none, showDisclosure: Bool = false, last: Bool = false, onTap: (() -> ())? = nil) {
        super.bind(titleIcon: item.icon.flatMap { UIImage(named: $0) }, title: item.title, titleColor: .appGray, showDisclosure: showDisclosure, last: last)
        self.selectionStyle = selectionStyle

        descriptionView.snp.remakeConstraints { maker in
            maker.leading.equalTo(self.titleLabel.snp.trailing).offset(CGFloat.margin12x)
            maker.centerY.equalToSuperview()

            let descriptionBackgroundOffset = onTap == nil ? CGFloat.margin2x : 0
            if showDisclosure {
                maker.trailing.equalTo(self.disclosureImageView.snp.leading).offset(descriptionBackgroundOffset - CGFloat.margin3x)
            } else {
                maker.trailing.equalTo(contentView.snp.trailingMargin).offset(descriptionBackgroundOffset)
            }
        }

        descriptionView.bind(value: item.value, color: item.titleColor ?? .appOz, showExtra: item.showExtra, onTap: onTap)
        descriptionView.isUserInteractionEnabled = onTap != nil
    }

}
