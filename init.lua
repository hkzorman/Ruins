
local door_types =
{
	"doors:door_glass_a",
	"doors:door_glass_b",
	"doors:door_obsidian_a",
	"doors:door_obsidian_b",
	"doors:door_steel_a",
	"doors:door_steel_b",
	"doors:door_wood_a",
	"doors:door_wood_b",
}

local decorative_nodes =
{
	"default:bookshelf",
	"vessels:shelf",
	"default:grass_2",
	"default:junglegrass",
	"default:dry_shrub",
	"beds:bed_bottom",
	"farming:straw"
}

local loot_nodes =
{
	"default:chest_locked",
	"default:chest"
}

local biomes =
{
	GRASSLAND = "grassland",
	MIXED_TREE_FOREST = "mixed_tree_forest",
	SNOWY_GRASSLAND = "snowy_grassland",
	SAVANNA = "savanna",
	RAIN_FOREST = "rainforest",
	CONIFEROUS_FOREST = "pineforest",
	DESERT = "desert",
	COLD_DESERT = "cold_desert",
	SANDSTONE_DESERT = "sandstone_desert",
	TAIGA = "taiga",
	TUNDRA = "tundra",
	ICESHEET = "icesheet"
}

local materials =
{
	[biomes.GRASSLAND] = {
		spawn = "default:default:default:default:default:dirt_with_grass",
		ground = "dirt",
		wall = {"default:wood", "default:cobble", "default:stonebrick"},
		doors =
		{
			"doors:door_steel_a",
			"doors:door_steel_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:wood", "default:stonebrick"}
	},
	[biomes.MIXED_TREE_FOREST] = {
		spawn = "default:default:default:default:default:dirt_with_grass",
		ground = "dirt",
		wall = {"default:wood", "default:stonebrick", "default:aspen_wood"},
		doors =
		{
			"doors:door_steel_a",
			"doors:door_steel_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:aspen_wood", "default:wood", "default:brick"}
	},
	[biomes.SNOWY_GRASSLAND] = {
		spawn = "default:default:default:default:dirt_with_snow",
		ground = "dirt",
		wall = {"default:pine_tree", "default:tree"},
		doors =
		{
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:pine_wood", "default:wood"}
	},
	[biomes.SAVANNA] = {
		spawn = "default:default:default:dirt_with_dry_grass",
		ground = "dirt",
		wall = {"default:acacia_wood", "default:acacia_tree", "default:stonebrick"},
		doors =
		{
			"doors:door_steel_a",
			"doors:door_steel_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:acacia_tree", "default:cobble"}
	},
	[biomes.DESERT] = {
		spawn = "default:default:desert_sand",
		ground = "desert_sand",
		wall = {"default:desert_sandstone", "default:desert_sandstone_brick",
		"default:desert_stone", "default:desert_stone_brick"},
		doors =
		{
			"doors:glass_a",
			"doors:glass_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:desert_sandstone_block", "default:desert_stone_block",}
	},
	[biomes.SANDSTONE_DESERT] = {
		spawn = "default:desert_sand",
		ground = "desert_sand",
		wall = {"default:sandstone", "default:sandstonebrick"},
		doors =
		{
			"doors:glass_a",
			"doors:glass_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:sandstone", "default:sandstone_block"}
	},
	[biomes.CONIFEROUS_FOREST] = {
		spawn = "default:dirt_with_grass",
		ground = "dirt",
		wall = {"default:pine_wood", "default:pine_tree", "default:stonebrick"},
		doors =
		{
			"doors:door_steel_a",
			"doors:door_steel_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:pine_wood", "default:stonebrick"}
	},
	[biomes.RAIN_FOREST] = {
		spawn = "default:default:dirt_with_rainforest_litter",
		ground = "dirt",
		wall = {"default:jungle_wood", "default:cobble", "default:stonebrick"},
		doors =
		{
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:jungle_wood", "default:stonebrick"}
	},
	[biomes.COLD_DESERT] = {
		spawn = "default:silver_sand",
		ground = "silver_sand",
		wall = {"default:silver_sandstone", "default:silver_sandstone_brick"},
		doors =
		{
			"doors:door_obsidian_a",
			"doors:door_obsidian_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:silver_sandstone_block", "default:silver_sandstone_brick"}
	},
	[biomes.TUNDRA] = {
		spawn = "default:snowblock",
		ground = "stone",
		wall = {"default:cobble", "default:stonebrick"},
		doors =
		{
			"doors:door_steel_a",
			"doors:door_steel_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:stone", "default:stone_block"}
	},
	[biomes.TAIGA] = {
		spawn = "default:dirt_with_snow",
		ground = "dirt",
		wall = {"default:pine_tree", "default:snowblock"},
		doors =
		{
			"doors:door_steel_a",
			"doors:door_steel_b",
			"doors:door_wood_a",
			"doors:door_wood_b"
		},
		roof = {"default:pine_tree", "default:snowblock"}
	},
	[biomes.ICESHEET] = {
		spawn = "default:ice",
		ground = "ice",
		wall = {"default:snowblock", "default:ice", "default:obsidian"},
		doors =
		{
			"doors:door_obsidian_a",
			"doors:door_obsidian_b"
		},
		roof = {"default:snowblock", "default:obsidianbrick"}
	},
}

local function can_replace(pos)
	local n = minetest.get_node_or_nil(pos)
	if n and n.name and minetest.registered_nodes[n.name] and not minetest.registered_nodes[n.name].walkable then
		return true
	elseif not n then
		return true
	else
		return false
	end
end


local function ground(pos, biome)
	local p2 = pos
	local cnt = 0
	local mat = materials[biome].ground
	p2.y = p2.y-1
	-- Create base for the building
	while can_replace(p2) == true do--minetest.get_node(p2).name == "air" do
		cnt = cnt+1
		if cnt > 200 then break end
		if cnt > math.random(2,4) then mat = "stone" end
		minetest.set_node(p2, {name="default:"..mat})
		p2.y = p2.y-1
	end
end


local function door(pos, biome)
	pos.y = pos.y+1
	if math.random(0,1) > 0 then
		if math.random(0,1)>0 then pos.x=pos.x+6 end
		pos.z = pos.z + 3
	else
		if math.random(0,1)>0 then pos.z=pos.z+6 end
		pos.x = pos.x + 3
	end
	minetest.remove_node(pos)
	pos.y = pos.y+1
	minetest.remove_node(pos)
	-- Place a MTG door in some cases
	local door_chance = math.random(1,10)
	if door_chance > 2 then
		pos.y = pos.y-1
		local doors = materials[biome].doors
		minetest.set_node(pos,{name=doors[math.random(1, #doors)]})
	end
end


local function add_node_inside(x, y, z, xi, yi, zi, max_decor_limit, max_loot_limit)
	-- Check for floor to set items
	if yi == 1 then
		-- Decoration chance
		local decoration_chance = math.random(1,100)
		if decoration_chance > 75 then
			local decoration_node = decorative_nodes[math.random(#decorative_nodes)]
			-- Add a decoration next to wall
			if (xi == 1 or zi == 1 or xi == 5 or zi == 5) then
				minetest.set_node({x=x+xi, y=y+yi, z=z+zi}, {name=decoration_node})
			end
		end
		-- Loot chance
		local loot_chance = math.random(1, 100)
		if loot_chance > 90 then
			local loot_node = loot_nodes[math.random(#loot_nodes)]
			-- Add a chest in this position
			minetest.set_node({x=x+xi, y=y+yi, z=z+zi}, {name=loot_node})
		end
	else
		-- Remove node to make space inside
		minetest.remove_node({x=x+xi, y=y+yi, z=z+zi})
	end
end


local function detect_biome(mpos)
	-- Check nodes to determine biome
	local radius = 6
	local num = {}
	local pos, count = minetest.find_nodes_in_area(
		{x = mpos.x - radius, y = mpos.y - radius, z = mpos.z - radius},
		{x = mpos.x + radius, y = mpos.y + radius, z = mpos.z + radius},
		{
			-- "default:lava_flowing", "default:lava_source",
			"default:dirt_with_dry_grass", "default:dirt_with_grass",
			"default:dirt_with_snow", "default:dirt_with_rainforest_litter", "default:sand",
			"default:silver_sand", "default:desert_sand", "default:snowblock", "default:stone",
			"default:gravel", "default:ice", "default:sandstone", "default:aspen_tree",
			"default:pine_tree", "default:acacia_tree", "default:jungletree"
		})

	num[biomes.GRASSLAND] = (count["default:dirt_with_grass"] or 0)
							+ (count["default:tree"] or 0)
	num[biomes.MIXED_TREE_FOREST] = (count["default:dirt_with_grass"] or 0)
							+ (count["default:aspen_tree"] or 0)
	num[biomes.SAVANNA] = (count["default:dirt_with_dry_grass"] or 0)
					+ (count["default:acacia_tree"] or 0)
	num[biomes.RAIN_FOREST] = (count["default:dirt_with_rainforest_litter"] or 0)
						+ (count["default:jungletree"] or 0)
	num[biomes.CONIFEROUS_FOREST] = (count["default:dirt_with_grass"] or 0)
						+ (count["default:pine_tree"] or 0)
	num[biomes.SNOWY_GRASSLAND] = (count["default:dirt_with_snow"] or 0) + (count["default:snow"] or 0)
	num[biomes.DESERT] = (count["default:desert_sand"] or 0) + (count["default:desert_stone"] or 0)
	num[biomes.SANDSTONE_DESERT] = (count["default:sand"] or 0) + (count["default:sandstone"] or 0)
	num[biomes.COLD_DESERT] = (count["default:silver_sand"] or 0)
	num[biomes.TUNDRA] = (count["default:snowblock"] or 0) + (count["default:gravel"] or 0)
	num[biomes.ICESHEET] = (count["default:ice"] or 0) + (count["default:snowblock"] or 0)
					+ (count["default:gravel"] or 0)
	num[biomes.TAIGA] = (count["default:dirt_with_snow"] or 0) + (count["default:snow"] or 0)

	-- Return the biome with more nodes
	local result = ""
	local max_val = -1
	for key,val in pairs(num) do
		minetest.log("Biome: "..key..", count: "..val)
		if val > max_val then
			max_val = val
			result = key
		end
	end
	minetest.log("Choosing: "..result)
	return result
end

local function make(pos, biome)
	-- Choose materials from biome
	local walls = materials[biome].wall
	local roofs = materials[biome].roof
	local roof_material = roofs[math.random(1, #roofs)]
	local material = walls[math.random(1, #walls)]
	-- Choose if building is a ruin or a complete building
	local ruin = true
	local ruin_chance = math.random(1, 100)
	if ruin_chance > 65 then
		ruin = false
	end
	 for yi = 0,4 do
		for xi = 0,6 do
			for zi = 0,6 do
				if yi == 0 then
					-- Make base
					local p = {x=pos.x+xi, y=pos.y, z=pos.z+zi}
					minetest.set_node(p, {name="default:cobble"})
					minetest.after(1, ground, p, biome)--(p)
				elseif yi == 4 and not ruin then
					-- Make roof only if not a ruin
					local p = {x=pos.x+xi, y=pos.y+yi, z=pos.z+zi}
					minetest.set_node(p, {name=roof_material})
				else
					-- Make walls for ruins
					if ruin == true then
						if xi < 1 or xi > 5 or zi<1 or zi>5 then
							if math.random(1,yi) == 1 then
								local new = material
								if yi == 2 and math.random(1,10) == 3 then new = "default:glass" end
								local n = minetest.get_node_or_nil({x=pos.x+xi, y=pos.y+yi-1, z=pos.z+zi})
								if n and n.name ~= "air" then
									minetest.set_node({x=pos.x+xi, y=pos.y+yi, z=pos.z+zi}, {name=new})
								end
							end
						else
							add_node_inside(pos.x, pos.y, pos.z, xi, yi, zi, max_decor_limit,
							max_loot_limit)
							--minetest.remove_node({x=pos.x+xi, y=pos.y+yi, z=pos.z+zi})
						end
					elseif ruin == false then
						-- Make walls for building
						local node = material
						if xi < 1 or xi > 5 or zi < 1 or zi > 5 then
							-- Check for window conditions
							if yi == 2 and (xi == 2 or zi == 2 or xi == 4 or zi == 4) then
								node = "default:glass"
							end
							local n = minetest.get_node_or_nil({x=pos.x+xi, y=pos.y+yi-1, z=pos.z+zi})
							if n and n.name ~= "air" then
								minetest.set_node({x=pos.x+xi, y=pos.y+yi, z=pos.z+zi}, {name=node})
							end
						else
							-- Add inside decorations
							add_node_inside(pos.x, pos.y, pos.z, xi, yi, zi)
						end
					end
				end
			end
		end
	end
	door(pos, biome)
end


local perl1 = {
	SEED1 = 9130, -- Values should match minetest mapgen V6 desert noise.
	OCTA1 = 3,
	PERS1 = 0.5,
	SCAL1 = 250,
}

local is_set = false
local function set_seed(seed)
	if not is_set then
		math.randomseed(seed)
		is_set = true
	end
end

minetest.register_on_generated(function(minp, maxp, seed)

	if maxp.y < 0 then return end
	if math.random(0,10)<5 then return end
	set_seed(seed)

	local perlin1 = minetest.env:get_perlin(perl1.SEED1, perl1.OCTA1, perl1.PERS1, perl1.SCAL1)
	local noise1 = perlin1:get2d({x=minp.x,y=minp.y})--,z=minp.z})
	if noise1 < 0.36 or noise1 > -0.36 then
		local mpos = {x=math.random(minp.x,maxp.x), y=math.random(minp.y,maxp.y), z=math.random(minp.z,maxp.z)}
		minetest.after(0.5, function()
			-- Check which biome we are in
			local biome = detect_biome(mpos)
			local p2 = {}
			minetest.log("Detected biome: "..dump(biome))
			minetest.log("Searching for: "..dump(materials[biome].spawn).." within 25 nodes of "..minetest.pos_to_string(mpos))
			p2 = minetest.find_node_near(mpos, 25, materials[biome].spawn)
			if p2 then
				minetest.log("Found p2: "..minetest.pos_to_string(p2).." for "..dump(materials[biome].spawn))
			else
				minetest.log(dump(materials[biome].spawn).." not found.")
			end
			if not p2 or p2 == nil or p2.y < 0 then return end
			minetest.log("Spawning building in detected biome '"..dump(biome).."' at pos: "..minetest.pos_to_string(p2))
			make(p2, biome)
		end)
	end
end)
