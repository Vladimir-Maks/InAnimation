InAnimation = {}
InAnimation.__index = InAnimation

function InAnimation:Init(entity)
    if entity then
        local animation_data = {}
        setmetatable(animation_data, InAnimation)
        animation_data.entity = entity
        return animation_data
    end
end

function InAnimation:Play(animation_name, animation_playback_speed, is_reverse)
    is_reverse = is_reverse or false
    animation_playback_speed = animation_playback_speed or 1.0
    animation_name = animation_name or "None"

    self.anim_start_time = time.uptime()
end