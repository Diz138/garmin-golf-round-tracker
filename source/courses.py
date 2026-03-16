import requests
import json
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("API_KEY")
BASE_URL = "https://api.golfcourseapi.com/v1"

COURSES = [
    "Pine Ridge Country Club",
    "Sagamore Spring Golf Club"
]

headers = {
    "Authorization": f"Key {API_KEY}"
}

def search_course(name):
    response = requests.get(
        f"{BASE_URL}/search",
        headers=headers,
        params={"search_query": name}
    )
    if response.status_code == 200:
        results = response.json()
        courses = results.get("courses", [])
        if courses:
            return courses[0]  # Take the top result
        else:
            print(f"No results found for: {name}")
            return None
    else:
        print(f"Error fetching {name}: {response.status_code}")
        return None

def get_course_details(course_id):
    response = requests.get(
        f"{BASE_URL}/courses/{course_id}",
        headers=headers
    )
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Error fetching course details for ID {course_id}: {response.status_code}")
        return None

def main():
    all_courses = {}

    for course_name in COURSES:
        print(f"Searching for: {course_name}...")
        result = search_course(course_name)

        if result:
            course_id = result.get("id")
            print(f"Found: {result.get('club_name')} (ID: {course_id})")

            details = get_course_details(course_id)
            if details:
                all_courses[course_name] = details
                print(f"Fetched details for: {course_name}")

    with open("courses.json", "w") as f:
        json.dump(all_courses, f, indent=2)
        print("\nSaved all course data to courses.json")

if __name__ == "__main__":
    main()