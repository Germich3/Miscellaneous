--IMPORTS--
os.loadAPI("/disk/apis/cryptex.lua")
os.loadAPI("/disk/apis/redutils.lua")

--LIMIAR PANTALLA--
term.setBackgroundColor(colors.red)
term.clear()

--PARAMETROS--
local tArgs = {...}
if #tArgs ~= 5 then
    print("-----------------------")
    print("ERROR DE INICIALIZACION")
    print("-----------------------")
    print("")
    print("Se requieren los siguientes parametros:")
    print("")
    print("  - Parametro 1: Posicion del modem wireless")
    print("  - Parametro 2: Puerto local")
    print("  - Parametro 3: Posicion de la señal de redstone")
    print("  - Parametro 4: Tiempo del pulso en segundos")
    print("  - Parametro 5: Contraseña")
    print("")
    print("Ejemplo:")
    print("")
    print("  - lock back 8080 left 5 password")
    print("")
    return    
end

--VARIABLES--
local rdnum = math.random(1024, 2048)
local modem = peripheral.wrap(tArgs[1])
local port = tonumber(tArgs[2])
local pside = tArgs[3]
local ptime = tonumber(tArgs[4])
local checksum = cryptex.checksum(tArgs[5], rdnum)

--MAIN--
modem.closeAll()
modem.open(port)
while true do
    local ev, sd, fr, rfr, msg, ds = os.pullEvent("modem_message")
    local input = cryptex.checksum(msg, rdnum)
    if checksum == input then 
        redutils.pulse(pside, ptime)
    end
end
