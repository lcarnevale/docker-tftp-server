# Alpine TFTP Server on Docker Container
Simple docker container for starting a verbose TFTP server. The container uses latest version of Alpine Linux and tftp-hpa.

## How to Build it
```bash
docker build --rm -t local/tftp .
```

## How to Run it
```bash
docker run --rm -d \
    -v /var/tftpboot:/var/tftpboot \
    -v /dev/log:/dev/log \
    -p 69:69/udp \
    local/tftp
```

## How to Use it
Put file to /var/tftpboot.
```bash
$ echo "Hello, TFTP!" | sudo tee /var/tftpboot/hello.txt
```

Get file with tftp from TFTP server.
```bash
$ echo "get hello.txt" | tftp <TFTP_SERVER_ADDRESS>
$ cat hello.txt
Hello, TFTP!
```

Read the logs. Final destination dependents on your syslog configuration. In my case it was ```/var/log/syslog```, but generally could be something like ```/var/log/messages```.
```bash
$ tail -f /var/log/syslog | grep tftp
Jan 18 18:21:48 lcarnevale-pc in.tftpd[12]: RRQ from <IP_ADDRESS> filename hello.txt
```


## Credits
This repository is based on the [pghalliday-docker](https://github.com/pghalliday-docker) repository, which you can find [here](https://github.com/pghalliday-docker/tftp).
