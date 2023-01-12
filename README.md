# CACIC Use Case

![alt text](https://github.com/GTA-UFRJ/https://github.com/GTA-UFRJ/CACIC-Use-Case/tree/main/docs-resources/logo_cacic.png?raw=true)

CACIC (Trusted Access Control for Internet of Things Data in Clouds using Enclaves) is an architechture proposed in [1] and extensively evaluated in [2]. It leverages memory enclaves for customizing access permissions for IoT data in remote clouds, even if high privileged software (such as the OS) is compromised.

This repository demonstrates a Smart Grid use case, in which, with the help of an  IoT Access Point, Smart Meters publish energy consumption samples. Using a Management Application, users can query data or ask the server to publish data after applying more complex processings, such as aggregation or load forecasting.

![alt text](https://github.com/GTA-UFRJ/https://github.com/GTA-UFRJ/CACIC-Use-Case/tree/main/docs-resources/arquitechture.png?raw=true)

## Requisites

_Note: the system must run on Linux plattforms and all the following procedures were only tested on Ubuntu 20.04_

In order to run the project, first you have to install the Intel Software Guard Extensions resources, listed as follows:

* Install SGX SDK (C/C++ Software Development Kit)
* Enable your SGX device in BIOS (and in software, if necessary)
* Install SGX Driver and SGX PSW (Plattform Software)

The official documentation for installing these three resources is available at: https://download.01.org/intel-sgx/sgx-linux/2.12/docs/Intel_SGX_Installation_Guide_Linux_2.12_Open_Source.pdf. Note that this project is developed using Revision 2.12 of Intel SGX Linux Release. Correct operation is not ensured in other versions.

After installing SGX:

* Clone the following repository: https://github.com/yhirose/cpp-httplib.git
* Install Qt GUI library. This project is compatible with version 6 or higher 

* Other basic tools such as g++ compiler, Make, CMake must be necessary and can be easily installed using the default distributuion package manager

## Building steps

There are three tools: the server, the command line client tool, and the graphical user interface client tool, which are built with the related commands:
```
bash ./build-server-script.sh
bash ./build-cli-script.sh
bash ./build-gui-script.sh
```

## Execution

To initialize the server process, run the command:
```
./Server s
```
The argument is used to leverage enclave security properties (*s*). Use *i* to instantiate an insecure version of the server. The insecure mode is used to demonstrate the detailed step-by-step that the server performs when receiving client messages.

To open the client CLI tool help, run the command:
```
./Client
```
The help includes examples for publishing data to and queriying data from the server. 

To open the client GUI tool, run the command:
```
./CACIC-GUI
```
![alt text](https://github.com/GTA-UFRJ/https://github.com/GTA-UFRJ/CACIC-Use-Case/tree/main/docs-resources/app_windows_example.png?raw=true)

Before sending publication and query messages, it is necessary to configure the client. The required steps can be done using the CLI or GUI tools, as follows:

* Choose a 8-characters (0-9 and a-f) Client Identificator (ID, e.g. 72d41281)
* Choose a 32-characters (0-9 and a-f) Client Communication Key (CK)
* With the server running, register the client

_Note: in production environment, this key must be sent to the enclave after attestation using an encrypted channel. Intel offers code samples for remote attestation. One can attest a remote enclave, that can trasfer the data to other local enclaves, for example. For reference, access the SGX examples._

https://github.com/intel/linux-sgx/tree/master/SampleCode/LocalAttestation

https://github.com/intel/linux-sgx/tree/master/SampleCode/RemoteAttestation

* Customize your default access permissions for each data type. The type code *123456* is used for published samples and *555555* is used for published results from aggregating published samples.  

## Demonstration

We are currently submitting a Poster/Demo paper to INFOCOM 2023 [3]. We briefly describe the demonstration here.

The following four components are necessary to run our demo:

* A Smart Meter (SM) that periodicaly sends measurements HTTP consumption data (in kwh) as follows:

http://[access_point_url]:5555/smart-meter=[payload]

![alt text](https://github.com/GTA-UFRJ/https://github.com/GTA-UFRJ/CACIC-Use-Case/tree/main/docs-resources/smart_meter.jpg?raw=true)

* A Linux Access Point (AP) running the process ```./Client ap_init```
* A Linux User Equipment (UE) running the GUI (or CLI) Management Application, built with the steps above
* A Linux Server running the server process, built with the steps above

Video Link: **comming soon**

## Publications

[1] THOMAZ, Guilherme A.; GUERRA, Matheus B.; SAMMARCO, Matteo; CAMPISTA, Miguel Elias M.. CACIC: Controle de Acesso Confiável Usando Enclaves a Dados em Nuvem da Internet das Coisas. In: SIMPÓSIO BRASILEIRO DE REDES DE COMPUTADORES E SISTEMAS DISTRIBUÍDOS (SBRC), 40. , 2022, Fortaleza. Anais [...]. Porto Alegre: Sociedade Brasileira de Computação, 2022 . p. 573-586. ISSN 2177-9384. DOI: https://doi.org/10.5753/sbrc.2022.222377.

[2] THOMAZ, Guilherme A.; GUERRA, Matheus B.; SAMMARCO, Matteo; DETYNIECKI, Marcin; CAMPISTA, Miguel Elias M..  Tamper-proof Access Control for IoT Clouds Using Enclaves. Electrical Engineering Program, COPPE/UFRJ,  2022. Technical Report. (Under review process in Ad Hoc Networks Journal)

[3] THOMAZ, Guilherme A.; GUERRA, Matheus B.; SAMMARCO, Matteo; DETYNIECKI, Marcin; CAMPISTA, Miguel Elias M..  Customizable Access Policies using Enclaves: Demonstrating a Smart Grid Use Case. (Under submission process in IEEE INFOCOM 2023-IEEE Conference on Computer Communications Workshops)