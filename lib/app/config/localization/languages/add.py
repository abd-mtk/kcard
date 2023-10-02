import os
import json

new_data_ar = {"1": "مرحبا"}
new_data_en = {"1": "hello"}

folder_path = "lib\\app\\config\\localization\\languages"

for filename in os.listdir(folder_path):
    if filename.endswith(".json"):
        file_path = os.path.join(folder_path, filename)

        with open(file_path, "r", encoding="utf-8") as json_file:
            data = json.load(json_file)

        if filename == "en.json":
            data.update(new_data_en)
        elif filename == "ar.json":
            data.update(new_data_ar)

        with open(file_path, "w", encoding="utf-8") as json_file:
            json.dump(data, json_file, indent=4, ensure_ascii=False)
