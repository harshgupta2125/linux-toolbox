#!/bin/bash

while true; do
  echo "==============================="
  echo "       🧰 My Linux Toolbox     "
  echo "==============================="
  echo "1. System Info"
  echo "2. Disk Usage Report"
  echo "3. Top 5 Memory Consuming Processes"
  echo "4. Setup a Cron Job"
  echo "5. Create a New User"
  echo "6. Backup a Directory"
  echo "7. Monitor a Log File"
  echo "8. Exit"
  echo "==============================="
  read -p "Choose an option [1-8]: " choice

  case $choice in
    1)
      echo "------ System Info ------"
      uname -a
      hostnamectl
      echo "-------------------------"
      ;;
    2)
      echo "------ Disk Usage Report ------"
      df -h
      echo "-------------------------------"
      ;;
    3)
      echo "------ Top 5 Memory Consuming Processes ------"
      ps aux --sort=-%mem | head -n 6
      echo "---------------------------------------------"
      ;;
    4)
      echo "------ Setup a Cron Job ------"
      echo "Opening crontab..."
      crontab -e
      ;;
    5)
      read -p "Enter new username: " username
      sudo adduser "$username"
      ;;
    6)
      read -p "Enter directory to backup (e.g. /var/www/html): " source_dir
      read -p "Enter destination backup path (e.g. /backup): " backup_dir
      mkdir -p "$backup_dir"
      backup_file="$backup_dir/backup_$(date +%F).tar.gz"
      tar -czvf "$backup_file" "$source_dir"
      echo "Backup saved to: $backup_file"
      ;;
    7)
      read -p "Enter log file path to monitor (e.g. /var/log/syslog): " logfile
      echo "Press Ctrl+C to stop watching."
      tail -f "$logfile"
      ;;
    8)
      echo "Goodbye!"
      break
      ;;
    *)
      echo "Invalid option. Please choose 1-8."
      ;;
  esac

  echo ""
  read -p "Press Enter to return to menu..."
  clear
done

