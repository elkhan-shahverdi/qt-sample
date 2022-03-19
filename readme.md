## Steps

Install Ubuntu Desktop if necessary

```shell
    sudo apt install tasksel
    sudo tasksel install ubuntu-desktop
```

or

```shell
    sudo apt install x-window-system
```

1. Clone Project to Server
   ```shell
    git clone https://github.com/elkhan-shahverdi/qt-sample.git
    cd qt-sample/
   ```
2. Install Dependencies
   ```shell
    sudo apt update
    sudo apt install -y python3-pip
    sudo apt install -y net-tools
    sudo apt install -y build-essential
    sudo apt install -y qt5-default
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
       sudo systemctl start opla-test.service
       ```
    2. Stop Service
       ```shell
       sudo systemctl stop opla-test.service
       ```
    3. Restart Service
       ```shell
       sudo systemctl restart opla-test.service
       ```
    4. Status Service
       ```shell
       sudo systemctl status opla-test.service
       ```