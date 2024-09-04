local Codes = {
    'VERYDEMURE',
}

for i, v in pairs(Codes) do
    game:GetService('ReplicatedStorage'):WaitForChild('Knit'):WaitForChild('Services'):WaitForChild('CodesService'):WaitForChild('RF'):WaitForChild('Redeem'):InvokeServer(unpack({
        [1] = v
    }))
end
