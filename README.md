# remove all running and stoped containers

```sh
docker rm -f $(docker ps -aq) 2>/dev/null; docker system prune -a --volumes -f
```
---
# Resize EBS Storage

check the partitions
```
lsblk
```

Use a tool like growpart to resize the existing partition to fill the available space.This will resize the fourth partition (nvme0n1p4) to use the remaining unallocated space on the disk.
```
sudo growpart /dev/nvme0n1 4
```

Extend the Logical Volumes
Decide how much space to allocate to each logical volume. For example, to extend both the root and /var logical volumes:

```
sudo lvextend -l +50%FREE /dev/RootVG/rootVol
sudo lvextend -l +50%FREE /dev/RootVG/varVol
```

After extending the logical volumes, resize the filesystems to utilize the additional space.

For the root filesystem:

```
sudo xfs_growfs /
```

For the /var filesystem:

```
sudo xfs_growfs /var
```
---
### Verify MySQL Database

* login mysql in server

```bash
mysql -u root -pExpenseApp@1
```
```text
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| transactions       |
+--------------------+
5 rows in set (0.036 sec)
```

### Select the Transactions Database

```text
mysql> USE transactions;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
```

### Verify Tables

```text
mysql> SHOW TABLES;
+------------------------+
| Tables_in_transactions |
+------------------------+
| transactions           |
+------------------------+
1 row in set (0.001 sec)
```
---
# HOW TO WORKS DB

0. any project is start FIRST crate database
1. load defalt data
2. default data nutting but a schema
3. If you have DB credentials Anyone who can establish a connection can do it.
