project "tome_app"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files { "src/**.h", "src/**.cpp" }

   includedirs
   {
      "src",

	  -- Include engine
	  "../tome_engine/src",

	  -- FIXME: engine includes should be wrapped in engine
	  "$(VULKAN_SDK)/include",
	  "../tome_engine/third_party/flecs/distr",
	  "../tome_engine/third_party/spdlog/include",
	  "../tome_engine/third_party/vk-bootstrap/src",
	  "../tome_engine/third_party/vma/include",
	  "../tome_engine/third_party/glfw/include",
	  "../tome_engine/third_party/glm",

   }

   links
   {
      "tome_engine"
   }

   targetdir ("../binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" }
       buildoptions {
           "/utf-8"
       }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"