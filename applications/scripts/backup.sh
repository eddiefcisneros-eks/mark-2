#!/bin/bash
perform_bcakup() {
mkdir backup
cd backup
cp -r "file.txt"
tar -czvf backup.tar.gz
echo "Backup complete!"
exit 0
}
perform_backup $[1]
exit 0