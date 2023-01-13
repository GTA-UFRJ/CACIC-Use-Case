#ifndef AP_PERMS_SCREEN_H
#define AP_PERMS_SCREEN_H

#include <QDialog>

namespace Ui {
class ap_perms_screen;
}

class ap_perms_screen : public QDialog
{
    Q_OBJECT

public:
    explicit ap_perms_screen(QWidget *parent = nullptr);
    ~ap_perms_screen();
    void fill_table();

private slots:
    void add_clicked();

private:
    Ui::ap_perms_screen *ui;

    enum perms_column_t {TYPE, ID};
};

#endif // AP_PERMS_SCREEN_H
