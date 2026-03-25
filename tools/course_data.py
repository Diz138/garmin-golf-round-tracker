import json
from pathlib import Path
from jinja2 import Environment, FileSystemLoader

REPO_ROOT = Path(__file__).parent.parent

def generate_monkey_c(json_path: Path | str, output_path: Path | str) -> None:
    with open(json_path) as f:
        data = json.load(f)

    courses = []
    for course_name, course_data in data.items():
        tees = course_data["course"]["tees"]

        # TODO: handle multiple tees in GitHub Issue #6
        try:
            holes = tees["male"][0]["holes"]
        except (KeyError, IndexError):
            print(f"No tee data found for {course_name}, skipping...")
            continue

        pars = [hole["par"] for hole in holes]
        short_name = (
            course_name
            .replace(" Golf Club", "")
            .replace(" Golf Course", "")
            .replace(" Country Club", " CC")
        )
        courses.append({"short_name": short_name, "pars": pars})

    course_names = ["Free Play"] + [c["short_name"] for c in courses]

    env = Environment(
        loader=FileSystemLoader(Path(__file__).parent / "templates"),
        trim_blocks=True,
        lstrip_blocks=True,
    )
    template = env.get_template("courseData.mc.j2")
    output = template.render(courses=courses, course_names=course_names)

    with open(output_path, "w") as f:
        f.write(output)

    print(f"Generated {output_path} with {len(courses)} courses")


if __name__ == "__main__":
    generate_monkey_c(
        REPO_ROOT / "tools" / "data" / "courses.json",
        REPO_ROOT / "source" / "data" / "courseData.mc",
    )
