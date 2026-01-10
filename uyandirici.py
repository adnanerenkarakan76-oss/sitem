
import requests
import time

url = "https://satisfy-experiments.onrender.com"

print("--- Site Uyandirma Sistemi Baslatildi ---")

while True:
    try:
        response = requests.get(url)
        print(f"Durum: {response.status_code} - Site uyanik tutuldu. Saat: {time.strftime('%H:%M:%S')}")
    except Exception as e:
        print(f"Hata olustu: {e}")

    # 10 dakikada bir (600 saniye) bekler
    time.sleep(600)

