#!/usr/bin/env bash

# Dan Styles - Bash_RandomInsultGenerator
# All in fun.

# Prefixes with gender
prefixes=("yer mum:F" "yer dad:M" "yer nan:F")

# Endings
endings=(
    "claps when the toilet flushes"
    "irons crisps"
    "claps at microwaves"
    "shouts at Spotify ads"
    "takes selfies with the gas meter"
    "shares memes from 2009"
    "asks Siri for {poss} lottery numbers"
    "bookmarks Netflix"
    "prints out TikToks"
    "brings a packed lunch to McDonald’s"
    "updates Facebook with {poss} blood pressure"
    "leaves reviews for lampposts"
    "waves at pigeons"
    "keeps receipts for bananas"
    "argues with cash machines"
    "calls 999 for buffering"
    "claps when the toaster pops"
    "downloads podcasts onto DVD"
    "wears high heels to Lidl"
    "asks Alexa to make {obj} a brew"
    "sings Happy Birthday to traffic lights"
    "Googles 'Google'"
    "claps along to the fridge hum"
    "wears hi-vis to watch the darts"
    "brings binoculars to Aldi"
    "waves at trains that don’t stop"
    "prints emails in Comic Sans"
    "asks Alexa to check {poss} tyre pressure"
    "does push-ups during Bargain Hunt"
    "saves beer mats in ring binders"
    "argues with speed cameras"
    "brings {poss} own chair to Wetherspoons"
    "wears earplugs at the cinema"
    "keeps {poss} slippers in a toolbox"
    "shouts at parking meters"
    "records Match of the Day on VHS still"
    "puts aftershave on toast"
    "gives directions to pigeons"
    "has loyalty cards for bus stops"
    "calls IT support for {poss} kettle"
    "heckles the Antiques Roadshow"
    "shouts at scratch cards"
    "asks Alexa for bingo numbers"
    "argues with the weather forecast"
    "claps when Countdown starts"
    "wears earplugs for the lottery draw"
    "does star jumps during Songs of Praise"
    "waves at Google Street View cars"
    "keeps biscuits in a first aid kit"
    "takes selfies with the remote control"
)

# Objects
objects=(
    "a traffic cone" "a Greggs sausage roll" "a wheelie bin" "a fax machine" "a karaoke machine"
    "a lava lamp" "a shopping trolley" "a garden gnome" "a VHS rewinder" "a Lidl bag for life"
    "a Toblerone" "a packet of Rich Tea" "a Slush Puppie cup" "a broken Hoover" "a Spice Girls CD"
    "a pair of Crocs" "a flat cap" "a packet of Quavers" "a Kenwood toaster" "a novelty mug"
    "a deckchair" "a Chupa Chups lolly" "a knitting needle" "a Sports Direct mug" "a Postman Pat VHS"
    "a teapot" "a roll of wallpaper" "a bag of Monster Munch" "a hi-vis vest" "a soap dispenser"
    "a carton of Ribena" "a broken umbrella" "a budgie cage" "a sat nav from 2006"
)

# Verbs
verbs=(
    "argues with" "licks" "feeds" "shouts at" "dances with" "takes selfies with" "sings to"
    "gives directions to" "brings" "waves at" "googles" "prints out" "claps for" "does push-ups on"
    "saves receipts for" "complains about" "asks Siri about" "does karaoke with" "throws change at"
    "stares at" "polishes" "gives CPR to" "tucks in" "irons" "bookmarks" "feeds chips to"
    "saves loyalty points for" "buys insurance for" "saves as a wallpaper" "does star jumps with"
    "puts aftershave on" "tries to reboot" "keeps in a toolbox"
)

# Contexts
contexts=(
    "at Wetherspoons" "outside Aldi" "in Lidl car park" "on the Megabus" "at the post office"
    "outside the job centre" "at B&Q" "in Greggs" "during Bargain Hunt" "at the darts"
    "watching Songs of Praise" "at the bus stop" "in the garden centre" "at a car boot sale"
    "on Blackpool pier" "at Butlins" "in the cinema" "at the laundrette" "outside the chippy"
    "at a bus shelter" "in a KFC drive-thru" "at Argos" "watching Countdown" "at the ice rink"
    "on the school run" "at the bingo hall" "during Antiques Roadshow" "outside Sports Direct"
    "in Poundland" "outside a kebab shop" "at the MOT garage" "on the night bus" "watching Strictly"
    "at the seaside arcade"
)

# Loop
while true; do
    read -rp "Press Enter for the next insult (Ctrl+C to quit) " _

    # Pick random prefix
    prefix_entry="${prefixes[RANDOM % ${#prefixes[@]}]}"
    prefix_text="${prefix_entry%%:*}"
    gender="${prefix_entry##*:}"

    # Pronouns
    if [[ $gender == "M" ]]; then
        poss="his"
        pronoun="him"
        obj="him"
    else
        poss="her"
        pronoun="her"
        obj="her"
    fi

    if (( RANDOM % 2 == 0 )); then
        # Use original ending
        ending="${endings[RANDOM % ${#endings[@]}]}"
        ending="${ending//\{poss\}/$poss}"
        ending="${ending//\{pronoun\}/$pronoun}"
        ending="${ending//\{obj\}/$obj}"
    else
        # Generate new insult
        verb="${verbs[RANDOM % ${#verbs[@]}]}"
        object="${objects[RANDOM % ${#objects[@]}]}"
        context="${contexts[RANDOM % ${#contexts[@]}]}"
        ending="$verb $object $context"
    fi

    echo -e "\e[33m$prefix_text $ending\e[0m"
done
