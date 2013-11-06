Contents:

RBY Map Sets: /campaigns/
    Definitions in              /campaigns/configs/
    "Random" minimap dipslay in /campaigns/maps/
    Relying on macros from      /macros/RBY_Base.cfg
    
RBY Eras: /eras/
    Definitions in              /eras/RBY_No_Mirror.cfg
    Code that does the work in  /macros/RBY_Era.cfg
    Also some macros from       /macros/RBY_Base.cfg

All RBY Maps: /scenarios/
    Map files                   /scenarios/maps/
    Scenario definitions in     /scenarios/configs/
    Common code in              /macros/RBY_Base.cfg/
    Any unique code moved to    /scenarios/macros/
    Sometimes using             /macros/RBY_Extra.cfg/

This code doesn't do anything?
    /resources/

Some old code is backed up in
    /resources/graveyard/

although since we have git we can probably just delete that.
