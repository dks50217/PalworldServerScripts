官方有提供Rcon指令，因此先下載[rcon-cli](https://github.com/gorcon/rcon-cli)，方可使用官方伺服器指令

* 檢查RAM是否超過用量，倒數並關閉

    ```shell
    ./check_ram_ver2.sh
    ```

* 檢查外部IP是否更新，更新No-ip網址
    ```shell
    ./np_ip_checker.sh
    ```

* 檢查容器是否啟用，啟用後呼叫DiscordBot
    ```shell
    ./start_docker.sh
    ```

