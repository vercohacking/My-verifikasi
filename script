-- FuFa Mod Menu Framework
-- Desain: Transparan, Hijau, Gaya 3D

local menu = gg.choice({
    "TeleTim", "TeleMusuh", "Mata Hantu", 
    "Speed Run", "Wallhack", "HP 1000", 
    "Hide", "Exit"
}, nil, "--- FuFa Mod Menu ---")

-- Fungsi Menu
if menu == 1 then -- TeleTim
    -- Tambahkan logic teleport ke tim di sini
    gg.alert("Teleport ke Tim Aktif")
elseif menu == 2 then -- TeleMusuh
    -- Tambahkan logic teleport ke musuh di sini
    gg.alert("Teleport ke Musuh")
elseif menu == 3 then -- Mata Hantu
    -- Logic: Cari entitas monster/hantu, ubah warna jadi merah
    gg.alert("Mata Hantu Aktif: Hantu berwarna Merah")
elseif menu == 4 then -- Speed Run
    -- Logic: Ubah value speed di memory
    gg.alert("Speed Run Diaktifkan")
elseif menu == 5 then -- Wallhack
    -- Logic: Ubah collision atau rendering
    gg.alert("Wallhack Aktif (Tanpa jatuh ke bawah)")
elseif menu == 6 then -- HP 1000
    -- Logic: Write memory HP ke 1000
    gg.alert("HP Menjadi 1000")
elseif menu == 7 then -- Hide
    -- Membuat tombol melayang (Floating Button)
    gg.setVisible(false)
    createFloatingButton()
elseif menu == 8 then -- Exit
    os.exit()
end

-- Fungsi Tombol Melayang (Setelah di-hide)
function createFloatingButton()
    -- Ikon kotak bertuliskan 'F'
    -- Menggunakan fitur UI bawaan Delta/GG
    local btn = gg.createButton("F", {
        x = 0.5, y = 0.5, 
        color = "green", 
        style = "3d"
    })
    
    -- Event klik tombol
    if btn == true then
        gg.setVisible(true)
    end
end
