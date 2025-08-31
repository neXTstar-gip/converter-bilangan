import os

def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

def desimal_ke_biner(n):
    return bin(n).replace("0b", "")

def desimal_ke_oktal(n):
    return oct(n).replace("0o", "")

def desimal_ke_hexa(n):
    return hex(n).replace("0x", "").upper()

def biner_ke_desimal(b):
    return int(b, 2)

def oktal_ke_desimal(o):
    return int(o, 8)

def hexa_ke_desimal(h):
    return int(h, 16)

while True:
    clear()
    print("=== Menu Konversi Bilangan ===")
    print("----------------------------------") 
    print("1. Desimal -> Biner")
    print("2. Desimal -> Oktal")
    print("3. Desimal -> Hexa")
    print("4. Biner -> Desimal")
    print("5. Oktal -> Desimal")
    print("6. Hexa -> Desimal")
    print("7. Exit")

    pilihan = input("Pilih menu (1-7): ")

    if pilihan == "1":
        angka = int(input("Masukkan bilangan desimal: "))
        print(f"Hasil biner: {desimal_ke_biner(angka)}")
        input("Tekan Enter untuk kembali ke menu...")

    elif pilihan == "2":
        angka = int(input("Masukkan bilangan desimal: "))
        print(f"Hasil oktal: {desimal_ke_oktal(angka)}")
        input("Tekan Enter untuk kembali ke menu...")

    elif pilihan == "3":
        angka = int(input("Masukkan bilangan desimal: "))
        print(f"Hasil heksa: {desimal_ke_hexa(angka)}")
        input("Tekan Enter untuk kembali ke menu...")

    elif pilihan == "4":
        angka = input("Masukkan bilangan biner: ")
        print(f"Hasil desimal: {biner_ke_desimal(angka)}")
        input("Tekan Enter untuk kembali ke menu...")

    elif pilihan == "5":
        angka = input("Masukkan bilangan oktal: ")
        print(f"Hasil desimal: {oktal_ke_desimal(angka)}")
        input("Tekan Enter untuk kembali ke menu...")

    elif pilihan == "6":
        angka = input("Masukkan bilangan heksa: ")
        print(f"Hasil desimal: {hexa_ke_desimal(angka)}")
        input("Tekan Enter untuk kembali ke menu...")

    elif pilihan == "7":
        print("Keluar... bye bro 👋")
        break

    else:
        print("❌ Pilihan tidak valid, coba lagi!")
        input("Tekan Enter untuk kembali ke menu...")
