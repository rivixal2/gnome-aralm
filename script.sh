#!/bin/bash
whiptail --title "ВНИМАНИЕ" --msgbox "Все что выполняется в данном скрипте, рекомендуем сделать backup системы. Т.К система немного даст изменения. НАСТОЯТЕЛЬНО РЕКОМЕНДУЮ НЕ ВЫКЛЮЧАТЬ КОМПЬЮТЕР Т.К МОГУТ ВЫЗВАТЬ ОШИБКИ" 10 60
{
    for ((i = 0 ; i <= 100 ; i+=40)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Подождите ... Идёт подготовка скрипта" 6 60 0
sudo apt install -f
mkdir /home/backup
sudo cp '/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga' '/home/backup'
{
    for ((i = 0 ; i <= 100 ; i+=90)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Backup data" 6 60 0
DISTROS=$(whiptail --title "Выберите ТОЛЬКО один, иначе файлы будут конфликтовать" --checklist \
"Выберите предпочитаемый рингтон для будильника" 15 60 4 \
"sakura drop" "Huawei" OFF \
"cosmos" "Mystical Planet" OFF \
"sound 3" "Ringtone 3" OFF \
"sound 4" "Ringtone 4" OFF 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Ваш любимый дистрибутив:" $DISTROS
else
    echo "Вы выбрали отмену."
fi
 
echo
 
echo "Выполнение комманды"
for word in $DISTROS
do
    echo $word
done
 
echo
 
echo "Выполним проверки исходя из введённых строк:"
for word in $DISTROS
do
    if [ $word == "\"sakura drop\"" ]; then
        mv 1.oga alarm-clock-elapsed.oga
              sudo cp 'alarm-clock-elapsed.oga' '/usr/share/sound/freedesktop/stereo/'
             play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
             mv alarm-clock-elapsed.oga 1.oga
    fi
    if [ $word == "\"cosmos\"" ]; then
        mv 2.oga alarm-clock-elapsed.oga
          sudo cp 'alarm-clock-elapsed.oga' '/usr/share/sounds/freedesktop/stereo/'
             play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
             mv alarm-clock-elapsed.oga 2.oga      
    fi
    if [ $word == "\"sound 3\"" ]; then
        mv 3.oga alarm-clock-elapsed.oga
              sudo cp 'alarm-clock-elapsed.oga' '/usr/share/sound/freedesktop/stereo/'
              play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
              mv alarm-clock-elapsed.oga 3.oga
    fi
    if [ $word == "\"sound 4\"" ]; then
        mv 4.oga alarm-clock-elapsed.oga
              sudo cp 'alarm-clock-elapsed.oga' '/usr/share/sound/freedesktop/stereo/'
              play /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
              mv alarm-clock-elapsed.oga 4.oga
    fi
done
whiptail --title "Готово" --msgbox "Вам осталось всего лишь закрыть это окно и поставить будильник." 10 60
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Удаление временных файлов" 6 60 0
