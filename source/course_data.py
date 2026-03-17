import json

def generate_monkey_c(json_path, output_path):
    with open(json_path) as f:
        data = json.load(f)

    lines = []
    lines.append("// AUTO-GENERATED FILE - DO NOT EDIT MANUALLY")
    lines.append("// Run generate_course_data.py to regenerate")
    lines.append("")
    lines.append("import Toybox.Lang;")
    lines.append("")
    lines.append("function getParsForCourse(name as String) as Array<Number> {")

    for course_name, course_data in data.items():
        tees = course_data["course"]["tees"]

        # Use male tees if available, otherwise fall back to female
        if tees.get("male") and len(tees["male"]) > 0:
            holes = tees["male"][0]["holes"]
        elif tees.get("female") and len(tees["female"]) > 0:
            holes = tees["female"][0]["holes"]
        else:
            print(f"No tee data found for {course_name}, skipping...")
            continue

        pars = [hole["par"] for hole in holes]

        # Shorten the name to match what's in courseList on the watch
        short_name = course_name.replace(" Golf Club", "").replace(" Golf Course", "").replace(" Country Club", " CC")

        lines.append(f'    if (name.equals("{short_name}")) {{')
        lines.append(f'        return {json.dumps(pars)} as Array<Number>;')
        lines.append(f'    }}')

    lines.append('    return [] as Array<Number>; // Free Play or unknown course')
    lines.append("}")
    lines.append("")

    # Also generate the courseList array
    lines.append("// Course list for the selection screen")
    course_names = ["Free Play"]
    for course_name in data.keys():
        short_name = course_name.replace(" Golf Club", "").replace(" Golf Course", "").replace(" Country Club", " CC")
        course_names.append(short_name)

    lines.append(f'var courseList = {json.dumps(course_names)} as Array<String>;')

    with open(output_path, "w") as f:
        f.write("\n".join(lines))

    print(f"Generated {output_path} with {len(data)} courses")
    for course_name in data.keys():
        short_name = course_name.replace(" Golf Club", "").replace(" Golf Course", "").replace(" Country Club", " CC")
        print(f"  - {short_name}")

if __name__ == "__main__":
    generate_monkey_c("courses.json", "source/courseData.mc")