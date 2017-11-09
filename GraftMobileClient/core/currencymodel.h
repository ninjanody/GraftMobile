#ifndef CURRENCYMODEL_H
#define CURRENCYMODEL_H

#include <QAbstractListModel>

class CurrencyItem;

class CurrencyModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum CurrencyRoles {
        TitleRole = Qt::UserRole + 1,
        CodeRole
    };
    Q_ENUM(CurrencyRoles)

    explicit CurrencyModel(QObject *parent = 0);
    ~CurrencyModel();

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;

    Q_INVOKABLE int indexOf(const QString &code) const;
    Q_INVOKABLE QString codeOf(const QString &name) const;

public slots:
    void add(const QString &name, const QString &code);

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<CurrencyItem*> mCurrency;
};

#endif // CURRENCYMODEL_H
