settings {
    logfile = "/var/log/lsyncd/lsyncd.log",
    statusFile = "/var/log/lsyncd/lsyncd.status"
}

function isTargetAvailable(target)
    if type(target) ~= "string" then
        return false
    end
    
    local file = io.open(target, "r")
    if file then
        io.close(file)
        return true
    else
        return false
    end
end

sync {
    default.rsync,
    source = "/mnt/NVME",
    target = "/mnt/RAID",
    delay = 30,
    init = isTargetAvailable,
    rsync = {
        archive = true,
        compress = false,
        update = true
    }
}
