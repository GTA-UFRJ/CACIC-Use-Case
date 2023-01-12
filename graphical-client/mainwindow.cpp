#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include "register_ue_screen.h"
#include "register_ap_screen.h"
#include "ue_perms_screen.h"
#include "ap_perms_screen.h"
#include "publish_screen.h"
#include "query_screen.h"
#include <iostream>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->register_ue_button, SIGNAL(pressed()), this, SLOT(register_ue_clicked()));
    connect(ui->register_ap_button, SIGNAL(pressed()), this, SLOT(register_ap_clicked()));
    connect(ui->ue_perms_button, SIGNAL(pressed()), this, SLOT(ue_perms_clicked()));
    connect(ui->ap_perms_button, SIGNAL(pressed()), this, SLOT(ap_perms_clicked()));
    connect(ui->publish_button, SIGNAL(pressed()), this, SLOT(publish_clicked()));
    connect(ui->query_button, SIGNAL(pressed()), this, SLOT(query_clicked()));
}

MainWindow::~MainWindow()
{
    std::cout << "Deleted MainWindow" << std::endl;
    delete ui;
}


void MainWindow::register_ue_clicked()
{
    // Model based approach
    std::cout << "Register UE clicked" << std::endl;
    register_ue_screen register_ue_screen_object;
    register_ue_screen_object.setModal(true);
    register_ue_screen_object.exec();

    // Creates a second window using this window (main) as parent
    // register_ue_screen_objptr = new register_ue_screen(this);
    //hide();
    //register_ue_screen_objptr->show();

}

void MainWindow::register_ap_clicked()
{
    std::cout << "Register AP clicked" << std::endl;
    register_ap_screen register_ap_screen_object;
    register_ap_screen_object.setModal(true);
    register_ap_screen_object.exec();
}



void MainWindow::ue_perms_clicked()
{
    std::cout << "UE Perms clicked" << std::endl;
    ue_perms_screen ue_perms_screen_object;
    ue_perms_screen_object.setModal(true);
    ue_perms_screen_object.exec();
}



void MainWindow::ap_perms_clicked()
{
    std::cout << "AP Perms clicked" << std::endl;
    ap_perms_screen ap_perms_screen_object;
    ap_perms_screen_object.setModal(true);
    ap_perms_screen_object.exec();
}

void MainWindow::publish_clicked()
{
    std::cout << "Publish clicked" << std::endl;
    publish_screen publish_screen_object;
    publish_screen_object.setModal(true);
    publish_screen_object.exec();
}


void MainWindow::query_clicked()
{
    std::cout << "Query clicked" << std::endl;
    query_screen query_screen_object;
    query_screen_object.setModal(true);
    query_screen_object.exec();
}

