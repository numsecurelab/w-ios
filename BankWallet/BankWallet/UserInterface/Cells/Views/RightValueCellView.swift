import UIKit
import SnapKit

class RightValueCellView: UIView {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        label.font = .appSubhead1
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)

        addSubview(label)
        label.snp.makeConstraints { maker in
            maker.leading.top.bottom.equalToSuperview()
            maker.trailing.equalToSuperview().inset(CGFloat.margin2x)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(text: String?, highlighted: Bool = false) {
        label.text = text
        label.textColor = highlighted ? .appOz : .appGray
    }

}
