#include "engine.h"

#include "flecs.h"
#include "VkBootstrap.h"
#include "vk_mem_alloc.h"
#include "GLFW/glfw3.h"
#include "spdlog/spdlog.h"


namespace tome
{
    void print_hello_world()
    {
        GLFWwindow* window;
        if (!glfwInit())
            return;

        window = glfwCreateWindow(640, 480, "Tome Engine", NULL, NULL);
        if (!window)
        {
            glfwTerminate();
            return;
        }

        glfwMakeContextCurrent(window);

        while (!glfwWindowShouldClose(window))
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
            glfwSwapBuffers(window);
            glfwPollEvents();
        }

        glfwTerminate();
    }
}
