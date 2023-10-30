#ifndef SQUARESLIST_H
#define SQUARESLIST_H

#include <QObject>
#include <QList>

class SquaresList : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<int> selectedSquares READ squares WRITE setSquares NOTIFY squaresChanged)

public:
    SquaresList(QObject* parent = nullptr);

    QList<int> squares() const;

    void setSquares(const QList<int>& new_squares);

signals:
    void squaresChanged();

private:
    QList<int> m_selectedSquares;
};

#endif // SQUARESLIST_H
