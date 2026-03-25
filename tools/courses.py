import requests
import json
import time
import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("API_KEY")
BASE_URL = "https://api.golfcourseapi.com/v1"

COURSES = [
    "Pine Meadows Golf Course",
    "Butternut Farm Golf Course",
    "Pine Ridge Country Club",
    "Sagamore Spring Golf Club",
    "Patriot Golf Course",
    "Meadow Brook Golf Club",
    "George Wright Golf Course",
    "William J. Devine Golf Course",
    "Butter Brook Golf Club",
    "Gannon Municipal Golf Course",
    "Stow Acres Country Club",
    "Shaker Hills Country Club",
    "Far Corner Golf"
]

OUTPUT_PATH = Path(__file__).parent / "data" / "courses.json"

headers = {
    "Authorization": f"Key {API_KEY}"
}


def search_course(name: str) -> dict | None:
    try:
        response = requests.get(
            f"{BASE_URL}/search",
            headers=headers,
            params={"search_query": name}
        )
        response.raise_for_status()
        results = response.json()
        courses = results.get("courses", [])
        if not courses:
            print(f"No results found for: {name}")
            return None
        return courses[0]
    except requests.RequestException as e:
        print(f"Error fetching {name}: {e}")
        return None


def get_course_details(course_id: str | int) -> dict | None:
    try:
        response = requests.get(
            f"{BASE_URL}/courses/{course_id}",
            headers=headers
        )
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        print(f"Error fetching course details for ID {course_id}: {e}")
        return None


def main() -> None:
    all_courses = {}

    for course_name in COURSES:
        time.sleep(1) # Rate limiting
        result = search_course(course_name)
        if result:
            course_id = result.get("id")

            details = get_course_details(course_id)
            if details:
                all_courses[course_name] = details
                print(f"Fetched details for: {course_name}")

    with open(OUTPUT_PATH, "w") as f:
        json.dump(all_courses, f, indent=2)
    print(f"\nSaved all course data to {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
