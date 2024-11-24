group "third_party"
    include "third_party/build_flecs.lua"
    include "third_party/build_spdlog.lua"
    include "third_party/build_vk-bootstrap.lua"
    include "third_party/build_glfw.lua"
group ""

project "tome_engine"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files {
     "src/**.h",
     "src/**.cpp"
   }

   includedirs
   {
      "src",

	  -- Include ThirdParty
	  "$(VULKAN_SDK)/include",
	  "third_party/flecs/distr",
	  "third_party/spdlog/include",
	  "third_party/vk-bootstrap/src",
	  "third_party/vma/include",
	  "third_party/glfw/include",
	  "third_party/glm",
   }

   links {
      "flecs",
      "spdlog",
      "vk-bootstrap",
      "glfw",
      "$(VULKAN_SDK)/lib/slang"
   }

   targetdir ("../binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }
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

