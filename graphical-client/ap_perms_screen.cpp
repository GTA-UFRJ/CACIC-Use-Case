#include "ap_perms_screen.h"
#include "ui_ap_perms_screen.h"
#include "result_screen.h"
#include "client_generic_interface.h"
#include "config_macros.h"

#include <iostream>

ap_perms_screen::ap_perms_screen(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ap_perms_screen)
{
    ui->setupUi(this);
    fill_table();

    connect(ui->add_button, SIGNAL(pressed()), this, SLOT(add_clicked()));
}

ap_perms_screen::~ap_perms_screen()
{
    std::cout << "Deleted ap_perms_screen" << std::endl;
    delete ui;
}

void ap_perms_screen::fill_table()
{
    std::string consumption_type("123456");
    std::string consumption_ids = "";
    int ret1 = read_ap_perm_interface(consumption_type, &consumption_ids);

    std::string aggregated_type("555555");
    std::string aggregated_ids = "";
    int ret2 = read_ap_perm_interface(aggregated_type, &aggregated_ids);

    if(ret1 | ret2) {
        result_screen::show_result_screen(43);
        hide();
    }

    // edit table
    ui->table->setColumnCount(2);
    QStringList column_names;
    column_names << "Type" << "Permitted IDs";
    ui->table->setHorizontalHeaderLabels(column_names);

    int row = 0;
    if(consumption_ids.size()) {
        row = ui->table->rowCount();
        ui->table->insertRow(row);
        ui->table->setItem(row, TYPE, new QTableWidgetItem(QString("Smart Meter")));
        ui->table->setItem(row, ID, new QTableWidgetItem(QString(consumption_ids.c_str())));
    }
    if(aggregated_ids.size()) {
        row = ui->table->rowCount();
        ui->table->insertRow(row);
        ui->table->setItem(row, TYPE, new QTableWidgetItem(QString("Aggregated")));
        ui->table->setItem(row, ID, new QTableWidgetItem(QString(aggregated_ids.c_str())));
    }
}

void ap_perms_screen::update_table()
{
    std::string consumption_type("123456");
    std::string consumption_ids = "";
    read_perm_interface(consumption_type, &consumption_ids);

    std::string aggregated_type("555555");
    std::string aggregated_ids = "";
    read_perm_interface(aggregated_type, &aggregated_ids);

    ui->table->setItem(0, TYPE, new QTableWidgetItem(QString("Smart Meter")));
    ui->table->setItem(0, ID, new QTableWidgetItem(QString(consumption_ids.c_str())));
    ui->table->setItem(1, TYPE, new QTableWidgetItem(QString("Aggregated")));
    ui->table->setItem(1, ID, new QTableWidgetItem(QString(aggregated_ids.c_str())));
}

void ap_perms_screen::add_clicked()
{
    std::string type = ui->type_lineedit->text().toStdString();
    std::cout << "type: " << type << std::endl;
    std::string perms = ui->perms_lineedit->text().toStdString();
    std::cout << "perms: " << perms << std::endl;

    bool filled_box = false;
    while(!filled_box) {
        if(perms[0] == ' ')
            perms.erase(perms.begin());
        else
            filled_box = true;
    }

    std::cout << "Calling function write_ap_perm_interface()" << std::endl;
    int ret = write_ap_perm_interface(type, perms);
    result_screen::show_result_screen(ret);

    update_table();

    //hide();
}

