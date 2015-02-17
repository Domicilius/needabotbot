#!/bin/bash
touch ../botideas
randint=`dice 9`

read nick chan saying
if `echo $saying | grep -i '\bneed a\b' | grep -i '\bbot\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: you could write it..."
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i 'bot \bneeds\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: make a pull request :D"
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i 'nabb: source' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: http://goo.gl/IIQt53 is my source file"
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i '!dropthemic' > /dev/null` ; then
    echo "PRIVMSG $chan :OOOOH! You just got *served*!"
elif `echo $saying | grep -i 'nabb: are you a bot?' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: I sure am :)"
elif `echo $saying | grep -i 'nabb: make me a sandwich' > /dev/null` ; then
    if [ "$nick" = dom ] ; then
        echo "PRIVMSG $chan :$nick: Sure thing, buddy."
    elif [ "$nick" = relsqui ] ; then
        echo "PRIVMSG $chan :$nick: Alright, I *guess* I can make you a sandwich."
    else
       echo "PRIVMSG $chan :$nick: I'll never be used by the likes of you!"
    fi        
elif `echo $saying | grep -i "nabb: spam\b" > /dev/null` ; then
    ticket=`echo $saying | cut -d ' ' -f 3` 
    if [ "$nick" = dom ] ; then
        if [[ $ticket =~ ^[0-9]{6}$ ]] ; then 
            snot -F SPAM $ticket
        fi 
    fi
elif `echo $saying | grep -i '!kekball' > /dev/null` ; then
    kekball=`sed -n "$randint"p kekball`
    echo "PRIVMSG $chan :$nick: $kekball"
elif `echo $saying | egrep -i 'nabb: I need some ideas' > /dev/null` ; then
    echo "PRIVMSG $nick :Here is what I have for bot ideas as well as who said them: "
    while read line
    do
        echo "PRIVMSG $nick : $line "
    done < ../botideas
fi


