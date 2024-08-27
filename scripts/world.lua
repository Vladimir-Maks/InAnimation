--при запуске мира будем читать файлы и записывать их в _G иначе придется каждый раз парсить при запуске мира.
--сама же библиотека будет просто интерфейсом для взаимодействия с сериализованными данными из _G
_G.ADR_VMS_ANIMATION_LIST = {}

local function parse_animation(anim_name, pack_name)
    local anim_path_path = pack_name..":./animations/".."anim_name.json"
    if file.isfile(anim_path_path) then
        _G.ADR_VMS_ANIMATION_LIST[anim_path_path.animation_name] = anim_path_path.animation_data
    end
end

function on_world_open()
    for k,v in pairs(pack.get_installed()) do
        local preload_path = v..":".."preload.json"
        if file.isfile(preload_path) then
            local preload_file = file.read(preload_path)
            local preload_table = json.parse(preload_file)
            if preload_table.animations then
                for ka,kv in pairs(config_table.animations) do
                    parse_animation(kv,v)
                end
            end
        end
    end
end

