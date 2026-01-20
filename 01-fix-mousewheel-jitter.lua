libinput:register({1})

last_positive = true
last_time = 0
SECOND = 1000000
delay = SECOND * 0.25

-- MODIFY
DEVICE_VID = 0x361d
DEVICE_PID = 0x0100


libinput:connect("new-evdev-device", function (device)
    local info = device:info()
    if info.vid == DEVICE_VID and info.pid == DEVICE_PID then
        device:connect("evdev-frame", function (device, frame, timestamp)
			change = false
            for _, event in ipairs(frame) do
                if event.usage == evdev.REL_WHEEL or event.usage == evdev.REL_WHEEL_HI_RES then
					local now = libinput:now()
					local is_positive = event.value > 0
					if last_time == 0 or last_time + delay <= now then
						last_time = now
						last_positive = is_positive
					elseif is_positive == last_positive then
						last_time = now
					else
						event.value = -event.value
						change = true
					end
                end
            end
            if change then
            	return frame
            else
            	return nil
            end
        end)
    end
end)
