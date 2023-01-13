#ifndef UE_PERMS_SCREEN_H
#define UE_PERMS_SCREEN_H

#include <QDialog>

namespace Ui {
class ue_perms_screen;
}

class ue_perms_screen : public QDialog
{
    Q_OBJECT

public:
    explicit ue_perms_screen(QWidget *parent = nullptr);
    ~ue_perms_screen();
    void fill_table();

private slots:
    void add_clicked();

private:
    Ui::ue_perms_screen *ui;

    enum perms_column_t {TYPE, ID};
};

#endif // UE_PERMS_SCREEN_H
