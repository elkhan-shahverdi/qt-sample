## Steps

Install Ubuntu Desktop if necessary

```shell
    sudo apt install tasksel
    sudo tasksel install ubuntu-desktop
```

1. Clone Project to Server
   ```shell
    git clone https://github.com/elkhan-shahverdi/qt-sample.git
    cd qt-sample/
   ```
2. Install Dependencies
   ```shell
    sudo apt update
    sudo apt install python3-pip
    sudo apt install net-tools
    sudo apt-get install build-essential
    sudo apt install qt5-default
   ```
3. Install PySide2
   ```shell    
    pip3 install PySide2
   ```
4. Create Service
   ```shell
    sudo cp ~/qt-sample/opla-test.service /lib/systemd/system/opla-test.service      
    sudo chmod 644 /lib/systemd/system/opla-test.service
    sudo systemctl daemon-reload
   ```
5. Service Management
    1. Start Service
       ```shell
       sudo systemctl start opla-test.servic
       ```
    2. Stop Service
       ```shell
       sudo systemctl stop opla-test.servic
       ```
    3. Restart Service
       ```shell
       sudo systemctl restart opla-test.servic
       ```
    4. Status Service
       ```shell
       sudo systemctl status opla-test.servic
       ```