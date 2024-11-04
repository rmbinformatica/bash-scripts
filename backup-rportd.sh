#!/bin/sh
sudo systemctl stop rportd
# Backup the sqlite databases
cd /var/lib/rport
DBS=*.db
for DB in $DBS;do 
    if [ "$DB" = "monitoring.db" ]; then
        continue
    fi
    echo $DB
    sqlite3 $DB ".backup '$DB.backup'"
done
DATA_HORA=$(date +%Y-%m-%d-%H%M%S)
# Pack and compress everything
tar --exclude='*.db' \
  -cvzf /var/backups/rportd-$DATA_HORA.tar.gz \
  /var/lib/rport /etc/rport

sudo chown ubuntu.ubuntu /var/backups/rportd-$DATA_HORA.tar.gz
sudo systemctl start rportd
cp /home/ubuntu/lftp.cmd /home/ubuntu/lftp-$DATA_HORA
sudo chown ubuntu.ubuntu /home/ubuntu/lftp-$DATA_HORA
echo "put /var/backups/rportd-$DATA_HORA.tar.gz" >> /home/ubuntu/lftp-$DATA_HORA
echo "exit" >> /home/ubuntu/lftp-$DATA_HORA
lftp -f /home/ubuntu/lftp-$DATA_HORA
rm -f /home/ubuntu/lftp-$DATA_HORA
