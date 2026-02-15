import yaml
import json

# Load YAML file
with open("feed.yaml", "r", encoding="utf-8") as file:
    data = yaml.safe_load(file)

# Write JSON file
with open("blog_feed.json", "w", encoding="utf-8") as json_file:
    json.dump(data, json_file, indent=2, ensure_ascii=False)

print("blog_feed.json generated successfully.")
