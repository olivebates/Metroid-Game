teleportLifetime = 0;
snap = global.snapValue;
floorx = floor(x/snap)*snap;
roundx = round(x/snap)*snap;
ceilx  = ceil (x/snap)*snap;
floory = floor((y-1)/snap)*snap;
roundy = round((y-1)/snap)*snap;
ceily  = ceil ((y-1)/snap)*snap;

// Controls
if (!irandom(300)) {
    if (left) {
        left = false
        right = true;
    } else {
        left = true;
        right = false;
    }
}

if (onFloor && !irandom(60)) {
    jump = true;
}

if (jump && !irandom(40)) {
    jump = false;
}

// Teleport back when backtracked
if (place_meeting(roundx, roundy, oNoBuild)){
    if ((instance_place(roundx, roundy, oNoBuild)).lifetime > 10)
    {
        teleportLifetime = clamp((instance_place(roundx, roundy, oNoBuild)).lifetime - 1, 0, 5000);
        with (oNoBuild) {
            lifetime -= other.teleportLifetime;
        }
        
        if (left) {
            left = false
            right = true;
        } else {
            left = true;
            right = false;
        }
        jump = false;
    }
}

// Nobuilds
if (!place_meeting(floorx, floory, oNoBuild)) {
    instance_create(floorx, floory, oNoBuild);
}
if (!place_meeting(ceilx, ceily, oNoBuild)) {
    instance_create(ceilx, ceily, oNoBuild);
}
if (!place_meeting(floorx, ceily, oNoBuild)) {
    instance_create(floorx, ceily, oNoBuild);
}
if (!place_meeting(ceilx, floory, oNoBuild)) {
    instance_create(ceilx, floory, oNoBuild);
}

// Create landing blocks
if (vspeed > 0) {
    if (left && !place_meeting(floorx, ceily + snap, oNoBuild)) {
        instance_create(floorx, ceily + snap, oWall);
        instance_create(floorx, ceily + snap, oNoBuild);
    } else if (!place_meeting(ceilx, ceily + snap, oNoBuild)){
        instance_create(ceilx, ceily + snap, oWall);
        instance_create(ceilx, ceily + snap, oNoBuild);
    }
}

// Create floor
if (onFloor && !place_meeting(x + hspeed, y, oWall)) {
    if (left && !place_meeting(floorx, ceily + snap, oNoBuild)) {
        instance_create(floorx, ceily + snap, oWall);
        instance_create(floorx, ceily + snap, oNoBuild);
    } else if (!place_meeting(ceilx, ceily + snap, oNoBuild)){
        instance_create(ceilx, ceily + snap, oWall);
        instance_create(ceilx, ceily + snap, oNoBuild);
    }
}
