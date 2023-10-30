#include "squareslist.h"
#include <QDebug>

SquaresList::SquaresList(QObject* parent) : QObject(parent) {}

QList<int> SquaresList::squares() const
{
    return m_selectedSquares;
}

void SquaresList::setSquares(const QList<int>& new_squares)
{
    qDebug() << new_squares;
    m_selectedSquares = new_squares;
    emit squaresChanged();
}
