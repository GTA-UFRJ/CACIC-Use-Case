#ifndef QUERY_SCREEN_H
#define QUERY_SCREEN_H

#include <QDialog>

namespace Ui {
class query_screen;
}

class query_screen : public QDialog
{
    Q_OBJECT

public:
    explicit query_screen(QWidget *parent = nullptr);
    ~query_screen();

private slots:
    void query_clicked();

private:
    Ui::query_screen *ui;
    std::string build_sql_statement(std::string types, std::string ids);
};

#endif // QUERY_SCREEN_H