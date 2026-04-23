local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local fileName = "DeltaKeyStorage.txt"
local correctKey = "1hours"
local duration = 3600 -- 1 jam dalam detik

local function saveLogin(timeValue)
    writefile(fileName, tostring(timeValue))
end

local function getSavedTime()
    if isfile(fileName) then
        return tonumber(readfile(fileName))
    end
    return nil
end

local function startScript()
    Rayfield:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Forsaken-Script/refs/heads/main/lua"))()
end

local savedTimestamp = getSavedTime()
if savedTimestamp and (os.time() - savedTimestamp) < duration then
    startScript()
    return
end

local Window = Rayfield:CreateWindow({
    Name = "Premium Key System",
    LoadingTitle = "Delta Executor",
    LoadingSubtitle = "by Gemini",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false 
})

local MainTab = Window:CreateTab("Login", 4483362458)

MainTab:CreateInput({
    Name = "Masukan Key",
    PlaceholderText = "Ketik di sini...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        if Text == correctKey then
            saveLogin(os.time())
            Rayfield:Notify({
                Title = "Success",
                Content = "Key Benar! Loading Script...",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            startScript()
                        end
                    },
                },
            })
            task.wait(2)
            startScript()
        else
            Rayfield:Notify({
                Title = "Wrong Key",
                Content = "Key salah atau sudah hangus!",
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

MainTab:CreateButton({
    Name = "Cek Status Waktu",
    Callback = function()
        local saved = getSavedTime()
        if saved then
            local remaining = duration - (os.time() - saved)
            if remaining > 0 then
                Rayfield:Notify({
                    Title = "Status",
                    Content = "Sisa waktu: " .. math.floor(remaining/60) .. " menit",
                    Duration = 5
                })
            else
                Rayfield:Notify({
                    Title = "Status",
                    Content = "Key sudah kadaluarsa.",
                    Duration = 5
                })
            end
        else
            Rayfield:Notify({
                Title = "Status",
                Content = "Belum ada key yang aktif.",
                Duration = 5
            })
        end
    end,
})
