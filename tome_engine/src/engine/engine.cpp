#include "engine.h"

#include "flecs.h"
#include "VkBootstrap.h"
#include "vk_mem_alloc.h"
#include "spdlog/spdlog.h"

namespace tome {
	void print_hello_world()
	{
		flecs::world world;

		auto e = world.entity();
		if (e.is_alive())
		{
			spdlog::info("e is alive");
		}
		else
		{
			spdlog::info("fuck");
		}
		e.destruct();
		if (e.is_alive())
		{
			spdlog::info("e is alive");
		}
		else
		{
			spdlog::info("fuck");
		}
	}

}
