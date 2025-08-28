## Dan Styles - PS_RandomInsultGenerator
## Feel free to add to it - edit it.. change it..
## All in fun.

$prefixes = @(
    @{Text="yer mum"; Gender="F"},
    @{Text="yer dad"; Gender="M"},
    @{Text="yer nan"; Gender="F"}
)

# Original endings with placeholders
$endings = @(
    "claps when the toilet flushes",
    "irons crisps",
    "claps at microwaves",
    "shouts at Spotify ads",
    "takes selfies with the gas meter",
    "shares memes from 2009",
    "asks Siri for {poss} lottery numbers",
    "bookmarks Netflix",
    "prints out TikToks",
    "brings a packed lunch to McDonald’s",
    "updates Facebook with {poss} blood pressure",
    "leaves reviews for lampposts",
    "waves at pigeons",
    "keeps receipts for bananas",
    "argues with cash machines",
    "calls 999 for buffering",
    "claps when the toaster pops",
    "downloads podcasts onto DVD",
    "wears high heels to Lidl",
    "asks Alexa to make {obj} a brew",
    "sings Happy Birthday to traffic lights",
    "Googles 'Google'",
    "claps along to the fridge hum",
    "wears hi-vis to watch the darts",
    "brings binoculars to Aldi",
    "waves at trains that don’t stop",
    "prints emails in Comic Sans",
    "asks Alexa to check {poss} tyre pressure",
    "does push-ups during Bargain Hunt",
    "saves beer mats in ring binders",
    "argues with speed cameras",
    "brings {poss} own chair to Wetherspoons",
    "wears earplugs at the cinema",
    "keeps {poss} slippers in a toolbox",
    "shouts at parking meters",
    "records Match of the Day on VHS still",
    "puts aftershave on toast",
    "gives directions to pigeons",
    "has loyalty cards for bus stops",
    "calls IT support for {poss} kettle",
    "heckles the Antiques Roadshow",
    "shouts at scratch cards",
    "asks Alexa for bingo numbers",
    "argues with the weather forecast",
    "claps when Countdown starts",
    "wears earplugs for the lottery draw",
    "does star jumps during Songs of Praise",
    "waves at Google Street View cars",
    "keeps biscuits in a first aid kit",
    "takes selfies with the remote control"
)

# Objects pool
$objects = @(
    "a traffic cone","a Greggs sausage roll","a wheelie bin","a fax machine","a karaoke machine",
    "a lava lamp","a shopping trolley","a garden gnome","a VHS rewinder","a Lidl bag for life",
    "a Toblerone","a packet of Rich Tea","a Slush Puppie cup","a broken Hoover","a Spice Girls CD",
    "a pair of Crocs","a flat cap","a packet of Quavers","a Kenwood toaster","a novelty mug",
    "a deckchair","a Chupa Chups lolly","a knitting needle","a Sports Direct mug","a Postman Pat VHS",
    "a teapot","a roll of wallpaper","a bag of Monster Munch","a hi-vis vest","a soap dispenser",
    "a carton of Ribena","a broken umbrella","a budgie cage","a sat nav from 2006"
)

# Verbs pool
$verbs = @(
    "argues with","licks","feeds","shouts at","dances with","takes selfies with","sings to",
    "gives directions to","brings","waves at","googles","prints out","claps for","does push-ups on",
    "saves receipts for","complains about","asks Siri about","does karaoke with","throws change at",
    "stares at","polishes","gives CPR to","tucks in","irons","bookmarks","feeds chips to",
    "saves loyalty points for","buys insurance for","saves as a wallpaper","does star jumps with",
    "puts aftershave on","tries to reboot","keeps in a toolbox"
)

# Contexts pool
$contexts = @(
    "at Wetherspoons","outside Aldi","in Lidl car park","on the Megabus","at the post office",
    "outside the job centre","at B&Q","in Greggs","during Bargain Hunt","at the darts",
    "watching Songs of Praise","at the bus stop","in the garden centre","at a car boot sale",
    "on Blackpool pier","at Butlins","in the cinema","at the laundrette","outside the chippy",
    "at a bus shelter","in a KFC drive-thru","at Argos","watching Countdown","at the ice rink",
    "on the school run","at the bingo hall","during Antiques Roadshow","outside Sports Direct",
    "in Poundland","outside a kebab shop","at the MOT garage","on the night bus","watching Strictly",
    "at the seaside arcade"
)

while ($true) {
    $null = Read-Host "Press Enter for the next insult (Ctrl+C to quit)"
    
    # Pick a random prefix (with gender)
    $prefix = Get-Random -InputObject $prefixes

    # Pronouns
    if ($prefix.Gender -eq "M") {
        $possessive = "his"
        $pronoun    = "him"
        $obj        = "him"
    }
    else {
        $possessive = "her"
        $pronoun    = "her"
        $obj        = "her"
    }

    # 50/50 chance: use original ending OR generate new one
    if ((Get-Random -Minimum 0 -Maximum 2) -eq 0) {
        # Pick from original endings
        $ending = Get-Random -InputObject $endings
        $ending = $ending -replace "{poss}", $possessive `
                           -replace "{pronoun}", $pronoun `
                           -replace "{obj}", $obj
    }
    else {
        # Build a fresh insult
        $verb    = Get-Random -InputObject $verbs
        $object  = Get-Random -InputObject $objects
        $context = Get-Random -InputObject $contexts
        $ending  = "$verb $object $context"
    }

    # Build insult
    $insult = "$($prefix.Text) $ending"
    Write-Host $insult -ForegroundColor Yellow
}
