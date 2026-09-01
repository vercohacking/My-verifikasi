#include <iostream>
#include <vector>
#include <map>
#include <cstdlib>
#include <ctime>
#include <thread>
#include <chrono>
#include <algorithm>

using namespace std;

// ===================== KONFIGURASI HADIAH =====================
struct Hadiah {
    string nama;
    int nilai; // semakin besar -> semakin prioritas
};

vector<Hadiah> daftarHadiah = {
    {"Jackpot", 100},
    {"Free Spin", 80},
    {"Bonus 50x", 90},
    {"Hadiah Konsol", 70},
    {"Voucher 100k", 60},
    {"Chip 1M", 50},
    {"Stiker", 10},
    {"Zonk", 0}
};

// ===================== FUNGSI SPIN =====================
string spinWheel() {
    // Simulasi spin dengan bias ke hadiah besar (probabilistik)
    int totalNilai = 0;
    for (auto &h : daftarHadiah) totalNilai += h.nilai;

    int roll = rand() % totalNilai;
    int cum = 0;
    for (auto &h : daftarHadiah) {
        cum += h.nilai;
        if (roll < cum) {
            return h.nama;
        }
    }
    return "Zonk";
}

// ===================== SPIN OTOMATIS SAMPAI DAPAT HADIAH BESAR =====================
void autoSpinUntilBigPrize(int batasMinNilai = 80) {
    cout << "[VEXUS] Memulai auto-spin... Target hadiah dengan nilai >= " << batasMinNilai << "\n";
    int percobaan = 0;
    string hasil;

    do {
        percobaan++;
        hasil = spinWheel();
        cout << "Spin #" << percobaan << ": " << hasil << "\n";

        // Cari nilai hadiah
        int nilaiHadiah = 0;
        for (auto &h : daftarHadiah) {
            if (h.nama == hasil) {
                nilaiHadiah = h.nilai;
                break;
            }
        }

        if (nilaiHadiah >= batasMinNilai) {
            cout << "[!] HADIAH BESAR DAPAT! Berhenti setelah " << percobaan << " spin.\n";
            return;
        }

        this_thread::sleep_for(chrono::milliseconds(200)); // jeda simulasi

    } while (true);
}

// ===================== FUNGSI UTAMA =====================
int main() {
    srand(time(0));
    cout << "=== VEXUS SPIN HACK ENGINE ===\n";
    cout << "Target: https://gloves.dewanaga77kl.com/ (403 Forbidden - tidak bisa diakses langsung)\n";
    cout << "Mode: Auto-spin dengan prioritas hadiah besar.\n\n";

    autoSpinUntilBigPrize(80); // cari hadiah minimal nilai 80

    // Simulasi multiple spin untuk statistik
    cout << "\n[STATISTIK 100 SPIN]\n";
    map<string, int> stat;
    for (int i = 0; i < 100; i++) {
        stat[spinWheel()]++;
    }
    for (auto &s : stat) {
        cout << s.first << ": " << s.second << "x\n";
    }

    return 0;
}
