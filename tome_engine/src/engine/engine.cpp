#include "engine.h"

#include "flecs.h"

#include <iostream>

namespace tome {
	void print_hello_world()
	{
		flecs::world world;

		auto e = world.entity();
		if (e.is_alive())
		{
			std::cout << "e is alive\n";
		}
		else
		{
			std::cout << "fuck\n";
		}
		e.destruct();
		if (e.is_alive())
		{
			std::cout << "e is alive\n";
		}
		else
		{
			std::cout << "fuck\n";
		}
	}

}