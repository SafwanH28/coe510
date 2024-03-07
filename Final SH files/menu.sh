
#!/bin/sh
MainMenu()
{
while [ "$CHOICE" != "START" ]
do
clear
echo
"================================================================="
echo "| Oracle All Inclusive Tool
|"
echo "| Main Menu - Select Desired Operation(s):
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-------------------------------------------------------------
----"
echo " WELCOME TO THE RIDE AND PICKUP DBMS"
echo " "
echo " $IS_SELECTED1 1) Drop Tables"
echo " $IS_SELECTED2 2) Create Tables"
echo " $IS_SELECTED3 3) Populate Tables"
echo " $IS_SELECTED4 4) Query Tables"
echo " $IS_SELECTED5 5) Join Tables"
echo " $IS_SELECTED6 6) Create Views"
echo " $IS_SELECTED7 7) View Views"
echo " $IS_SELECTED8 8) View Good Drivers"
echo " $IS_SELECTED9 9) Drop Advertisement Table"
echo " $IS_SELECTEDA A) View All Tables"
echo " $IS_SELECTEDB B) Create Advertisement"
echo " $IS_SELECTEDC C) Populate Advertisement"
echo " $IS_SELECTEDD D) Modify Tables"
echo " "
echo " $IS_SELECTEDE E) End/Exit"
echo " "
echo "Choose: "
read CHOICE
if [ "$CHOICE" == "0" ]
then
echo "Nothing Here"
elif [ "$CHOICE" == "1" ]
then
bash drop_tables.sh
sleep 5
Pause
elif [ "$CHOICE" == "2" ]
then
bash create_tables.sh
sleep 5
Pause
elif [ "$CHOICE" == "3" ]
then
bash populate_tables.sh
sleep 5
Pause
elif [ "$CHOICE" == "4" ]
then
bash query_tables.sh
sleep 10
Pause
elif [ "$CHOICE" == "5" ]
then
bash join_tables.sh
sleep 5
Pause
elif [ "$CHOICE" == "6" ]
then
bash create_view.sh
sleep 5
Pause
elif [ "$CHOICE" == "7" ]
then
bash view_view_tables.sh
sleep 5
Pause
elif [ "$CHOICE" == "8" ]
then
bash good_drivers.sh
sleep 5
Pause
elif [ "$CHOICE" == "9" ]
then
bash drop_advert.sh
sleep 5
Pause
elif [ "$CHOICE" == "A" ]
then
bash view_tables.sh
sleep 5
Pause
elif [ "$CHOICE" == "B" ]
then
bash create_advert.sh
sleep 5
Pause
elif [ "$CHOICE" == "C" ]
then
bash populate_advert.sh
sleep 5
Pause
elif [ "$CHOICE" == "D" ]
then
bash modify_tables.sh
sleep 5
Pause

elif [ "$CHOICE" == "E" ]
then
exit
fi
done
}
#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
StartMessage
while [ 1 ]
do
MainMenu
done
}
ProgramStart

