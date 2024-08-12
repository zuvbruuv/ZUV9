-- creds to whoever made this ig
local DetectedF

        for _, v in ipairs(getgc()) do
            if (typeof(v) == "function" and islclosure(v) and table.find(debug.getconstants(v), ":: Adonis Anti Cheat::\n") and #debug.getupvalues(v) > 0) then
                DetectedF = v
                break
            end
        end

        if (not DetectedF) then
            return
        end

        local DisconnectF = debug.getupvalue(DetectedF, 7)
        local KillF = debug.getupvalue(DetectedF, 8)

        hookfunction(DisconnectF, function() end)
        hookfunction(KillF, function() end)

        local OldDetectedF

        OldDetectedF = hookfunction(DetectedF, function(action, info, nocrash)
            if (action ~= "_") then
                return coroutine.yield()
            end

            return OldDetectedF(action, info, nocrash)
        end)

        do
            local Players = game:GetService("Players")

            local LocalPlayer = Players.LocalPlayer
            local BlockedMethods = {"Kick", "kick"}

            hookfunction(LocalPlayer.Kick, function() end)

            local __namecall

            __namecall = hookmetamethod(game, "__namecall", function(self, ...)
                if (self == LocalPlayer and table.find(BlockedMethods, getnamecallmethod())) then
                    return
                end

                return __namecall(self, ...)
            end)
        end
