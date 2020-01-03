#!/bin/sh
isExists_sqlite=`ls -a /usr/bin | grep sqlite3_old`
if [ "$isExists_sqlite" != "sqlite3_old" ]; then
    #pwd
    cp roles/sqlite/files/sqlite-autoconf-3270200.tar.gz /usr/local/
    cd /usr/local
    tar -zxvf sqlite-autoconf-3270200.tar.gz
    cd sqlite-autoconf-3270200
    ./configure --prefix=/usr/local
    make && make install
    mv -f /usr/bin/sqlite3 /usr/bin/sqlite3_old
    ln -s -f /usr/local/sqlite3 /usr/bin/sqlite3

    sqlite3 --version

    echo 'export LD_LIBRARY_PATH="/usr/local/lib"' >>/root/.bashrc
    source /root/.bashrc
    echo 'export LD_LIBRARY_PATH="/usr/local/lib"' >>/home/buhuai/.bashrc
    source /home/buhuai/.bashrc
else
    echo "sqlite3 has been installed"

fi
