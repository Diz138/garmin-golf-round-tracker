// AUTO-GENERATED FILE - DO NOT EDIT MANUALLY
// Run generate_course_data.py to regenerate

import Toybox.Lang;

function getParsForCourse(name as String) as Array<Number> {
    if (name.equals("Pine Meadows")) {
        return [4, 3, 4, 5, 4, 3, 5, 4, 4, 4, 3, 4, 5, 4, 3, 4, 4, 5] as Array<Number>;
    }
    if (name.equals("Pine Ridge CC")) {
        return [4, 3, 4, 4, 4, 5, 4, 4, 4, 3, 4, 3, 4, 5, 4, 3, 5, 4] as Array<Number>;
    }
    if (name.equals("Sagamore Spring")) {
        return [5, 4, 5, 4, 4, 3, 4, 3, 3, 4, 5, 5, 4, 3, 4, 4, 3, 3] as Array<Number>;
    }
    if (name.equals("Patriot")) {
        return [4, 4, 3, 4, 3, 5, 4, 4, 4, 4, 4, 3, 4, 3, 5, 4, 4, 4] as Array<Number>;
    }
    if (name.equals("Meadow Brook")) {
        return [4, 4, 5, 4, 3, 4, 3, 4, 4, 4, 4, 5, 4, 3, 4, 3, 4, 4] as Array<Number>;
    }
    if (name.equals("George Wright")) {
        return [4, 4, 5, 3, 4, 4, 4, 3, 4, 4, 4, 4, 4, 3, 5, 4, 3, 4] as Array<Number>;
    }
    if (name.equals("William J. Devine")) {
        return [4, 4, 4, 3, 4, 4, 4, 3, 4, 4, 5, 4, 3, 4, 3, 4, 4, 5] as Array<Number>;
    }
    if (name.equals("Butter Brook")) {
        return [5, 4, 3, 4, 3, 4, 5, 3, 5, 4, 3, 5, 4, 3, 4, 5, 4, 4] as Array<Number>;
    }
    if (name.equals("Gannon Municipal")) {
        return [4, 4, 4, 4, 4, 3, 4, 4, 3, 4, 4, 4, 4, 3, 5, 3, 4, 5] as Array<Number>;
    }
    if (name.equals("Stow Acres CC")) {
        return [4, 4, 3, 4, 5, 5, 3, 4, 4, 5, 3, 4, 4, 5, 3, 4, 3, 5] as Array<Number>;
    }
    if (name.equals("Shaker Hills CC")) {
        return [4, 5, 3, 4, 5, 3, 4, 4, 4, 4, 4, 4, 3, 4, 5, 3, 4, 5] as Array<Number>;
    }
    if (name.equals("Far Corner Golf")) {
        return [4, 5, 4, 5, 4, 3, 4, 3, 4, 3, 5, 4, 4, 4, 4, 5, 3, 4] as Array<Number>;
    }
    return [] as Array<Number>; // Free Play or unknown course
}

// Course list for the selection screen
var courseList = ["Free Play", "Pine Meadows", "Pine Ridge CC", "Sagamore Spring", "Patriot", "Meadow Brook", "George Wright", "William J. Devine", "Butter Brook", "Gannon Municipal", "Stow Acres CC", "Shaker Hills CC", "Far Corner Golf"] as Array<String>;