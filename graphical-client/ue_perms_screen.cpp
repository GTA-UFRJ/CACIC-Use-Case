#include "ue_perms_screen.h"
#include "ui_ue_perms_screen.h"
#include "result_screen.h"
#include "client_generic_interface_dumb.h"
#include "config_macros.h"

#include <iostream>

ue_perms_screen::ue_perms_screen(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ue_perms_screen)
{
    ui->setupUi(this);
    fill_table();

    connect(ui->add_button, SIGNAL(pressed()), this, SLOT(add_clicked()));
}

ue_perms_screen::~ue_perms_screen()
{
    std::cout << "Deleted ue_perms_screen" << std::endl;
    delete ui;
}

void ue_perms_screen::fill_table()
{
    std::string consumption_type("123456");
    std::string consumption_ids = "";
    read_perm_interface(consumption_type, &consumption_ids);

    std::string aggregated_type("555555");
    std::string aggregated_ids = "";
    read_perm_interface(aggregated_type, &aggregated_ids);

    // edit table
}

void ue_perms_screen::add_clicked()
{
    std::string type = ui->type_lineedit->text().toStdString();
    std::cout << "type: " << type << std::endl;
    std::string perms = ui->perms_lineedit->text().toStdString();
    std::cout << "perms: " << perms << std::endl;

    std::cout << "Calling function write_perm_interface()" << std::endl;
    int ret = write_perm_interface(type, perms);
    result_screen::show_result_screen(ret);

    //hide();
}
