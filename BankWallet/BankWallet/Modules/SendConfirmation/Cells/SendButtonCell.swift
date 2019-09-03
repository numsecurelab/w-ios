import UIKit

class SendButtonCell: UITableViewCell {
    private let sendButton = RespondButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(sendButton)
        sendButton.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(SendTheme.margin)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(SendTheme.sendButtonHeight)
        }
        sendButton.backgrounds = ButtonTheme.yellowBackgroundDictionary
        sendButton.textColors = ButtonTheme.textColorDictionary
        sendButton.titleLabel.text = "send.confirmation.send_button".localized
        sendButton.cornerRadius = SendTheme.sendButtonCornerRadius
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func bind(onTap: (() -> ())?) {
        sendButton.onTap = onTap
    }

}