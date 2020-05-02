function setPulse(side, time)
    redstone.setOutput(side, true)
    os.sleep(time)
    redstone.setOutput(side, false)
end
