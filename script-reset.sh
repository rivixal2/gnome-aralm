#!/bin/bash
whiptail --title "ВНИМАНИЕ" --msgbox "Все что выполняется в данном скрипте, рекомендуем сделать backup системы. Т.К система немного даст изменения. НАСТОЯТЕЛЬНО РЕКОМЕНДУЮ НЕ ВЫКЛЮЧАТЬ КОМПЬЮТЕР Т.К МОГУТ ВЫЗВАТЬ ОШИБКИ" 10 60
cd /home
sudo mv backup alarm-clock-elapsed.oga
sudo cp 'alarm-clock-elapsed.oga' '/usr/share/sounds/freedesktop/stereo/'
whiptail --title "Готово" --msgbox "Восстановление сигнала, был завершён. Нажмите на ОК чтобы продолжить" 10 60

